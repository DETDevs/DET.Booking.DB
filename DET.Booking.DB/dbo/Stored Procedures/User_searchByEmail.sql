CREATE PROCEDURE [dbo].[User_SearchByEmail]
    @Email VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar que exista el ususario
        IF NOT EXISTS (SELECT 1 FROM [Person] WHERE  Email = @Email)
        BEGIN
            RAISERROR('El usuario no existe.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        SELECT u.UsuarioID, u.ContraseñaHash, p.Email, p.Name, u.RolID, u.BusinessID
            FROM [AppUser] u
            INNER JOIN Person p ON u.PersonID = p.PersonID
            WHERE p.Email = @Email AND p.IsActive = 1

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
