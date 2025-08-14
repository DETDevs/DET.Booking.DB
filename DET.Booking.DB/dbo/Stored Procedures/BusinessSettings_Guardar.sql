CREATE PROCEDURE [dbo].[BusinessSettings_Guardar]
    @BusinessID INT,
    @Key VARCHAR(100),
    @Value VARCHAR(255),
    @IsActive BIT,
    @User VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF EXISTS (
            SELECT 1 FROM BusinessSettings
            WHERE BusinessID = @BusinessID AND [Key] = @Key
        )
        BEGIN
            -- Actualizar registro existente
            UPDATE BusinessSettings
            SET
                [Value] = @Value,
                IsActive = @IsActive,
                ModificationUser = @User,
                ModificationDate = GETDATE()
            WHERE BusinessID = @BusinessID AND [Key] = @Key;
        END
        ELSE
        BEGIN
            -- Insertar nuevo registro
            INSERT INTO BusinessSettings
                (BusinessID, [Key], [Value], IsActive, CreateUser, CreateDate, ModificationUser, ModificationDate)
            VALUES
                (@BusinessID, @Key, @Value, @IsActive, @User, GETDATE(), NULL, NULL);
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
