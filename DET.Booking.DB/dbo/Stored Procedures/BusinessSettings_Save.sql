CREATE PROCEDURE [dbo].[BusinessSettings_Save]
    @SettingID INT = NULL,        -- Si es NULL, se inserta; si tiene valor, se actualiza
    @BusinessID INT,
    @Key VARCHAR(100),
    @Value NVARCHAR(MAX),
    @CreateUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IsActive BIT = 1;
        DECLARE @CreateDate DATETIME = GETDATE();

         IF @SettingID IS NULL
        BEGIN
            SET @SettingID = '';
        END

        IF NOT EXISTS (SELECT 1 FROM BusinessSettings WHERE SettingID = @SettingID AND [Key] = @Key)
        BEGIN
           INSERT INTO BusinessSettings
            (BusinessID, [Key], [Value], IsActive, CreateUser, CreateDate, ModificationUser, ModificationDate)
           VALUES
            (@BusinessID, @Key, @Value, @IsActive, @CreateUser, @CreateDate, NULL, NULL);
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
