CREATE PROCEDURE [dbo].[User_Register]
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @BusinessID INT,
    @RolID INT,
    @PasswordHash VARCHAR(255),
    @CreateUser VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar en tabla Person
        INSERT INTO Person (Name, Email, PhoneNumber, IsActive, CreateUser, CreateDate)
        VALUES (@Name, @Email, @PhoneNumber, 1, @CreateUser, GETDATE());

        DECLARE @PersonID INT = SCOPE_IDENTITY();

        -- Insertar en tabla User
        INSERT INTO [AppUser] (BusinessID, PersonID, RolID, ContraseñaHash, CreateUser, CreateDate, ModificationUser, ModificationDate)
        VALUES (@BusinessID, @PersonID, @RolID, @PasswordHash, @CreateUser, GETDATE(), NULL, NULL);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END
