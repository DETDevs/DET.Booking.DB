CREATE PROCEDURE [dbo].[Business_Save]
    @Name VARCHAR(100),
    @Code VARCHAR(50),
    @PrimaryColor VARCHAR(20),
    @SecondColor VARCHAR(20),
    @Logo VARCHAR(255),
    @CreateUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IsActive BIT = 1;
        DECLARE @CreateDate DATETIME = GETDATE();

        IF @Code IS NULL
        BEGIN
            SET @Code = '';
        END


        IF NOT EXISTS (SELECT 1 FROM Business WHERE Code = @Code)
        BEGIN
            -- Insertar nuevo negocio
            INSERT INTO Business (Name, Code, PrimaryColor, SecondColor, Logo, IsActive, CreateUser, CreateDate)
            VALUES (@Name, @Code, @PrimaryColor, @SecondColor, @Logo, @IsActive, @CreateUser, @CreateDate);
        END
        ELSE
        BEGIN
            MERGE INTO Business AS target
            USING 
			(
				VALUES (@Name, @Code, @PrimaryColor, @SecondColor, @Logo, @IsActive, @CreateUser, @CreateDate)
			) AS Source 
			(
				Name, Code, PrimaryColor, SecondColor, Logo, IsActive, CreateUser, CreateDate
			)
            ON target.Code = Source.Code
			WHEN MATCHED THEN
				UPDATE SET 
					target.Name = CASE WHEN Source.Name IS NOT NULL THEN Source.Name ELSE target.Name END,
					target.PrimaryColor = CASE WHEN Source.PrimaryColor IS NOT NULL THEN Source.PrimaryColor ELSE target.PrimaryColor END,
					target.SecondColor = CASE WHEN Source.SecondColor IS NOT NULL THEN Source.SecondColor ELSE target.SecondColor END,
					target.Logo = CASE WHEN Source.Logo IS NOT NULL THEN Source.Logo ELSE target.Logo END,
					target.IsActive = Source.IsActive,
					target.ModificationUser = Source.CreateUser,
					target.ModificationDate = GETDATE()
			WHEN NOT MATCHED THEN
				INSERT (Name, Code, PrimaryColor, SecondColor, Logo, IsActive, CreateUser, CreateDate)
				VALUES (Source.Name, Source.Code, Source.PrimaryColor, Source.SecondColor, Source.Logo, Source.IsActive, Source.CreateUser, Source.CreateDate);
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
