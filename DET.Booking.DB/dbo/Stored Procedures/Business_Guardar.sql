CREATE PROCEDURE [dbo].[Business_Guardar]
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

        -- Validar que no exista otro negocio con el mismo código
        IF EXISTS (
            SELECT 1 FROM Business WHERE Code = @Code AND IsActive = 1
        )
        BEGIN
            RAISERROR('Ya existe un negocio activo con ese código.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -- Insertar nuevo negocio
        INSERT INTO Business (Name, Code, PrimaryColor, SecondColor, Logo, IsActive, CreateUser, CreateDate)
        VALUES (@Name, @Code, @PrimaryColor, @SecondColor, @Logo, 1, @CreateUser, GETDATE());

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
