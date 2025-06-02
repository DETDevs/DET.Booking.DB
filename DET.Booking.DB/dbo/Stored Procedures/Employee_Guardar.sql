CREATE PROCEDURE [dbo].[Employee_Guardar]
    @BusinessID INT,
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @Puesto BIGINT,
    @IsActive BIT,
    @CreateUser VARCHAR(50),
    @CreateDate DATETIME,
    @ModificationUser VARCHAR(50),
    @ModificationDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PersonaID INT;

    -- Verificar si la persona ya existe por Email
    SELECT @PersonaID = PersonID FROM Person WHERE Email = @Email;

    -- Si no existe, insertarla
    IF @PersonaID IS NULL
    BEGIN
        INSERT INTO Person (
            [Name], [Email], [PhoneNumber], [IsActive],
            [CreateUser], [CreateDate], [ModificationUser], [ModificationDate]
        )
        VALUES (
            @Name, @Email, @PhoneNumber, @IsActive,
            @CreateUser, @CreateDate, @ModificationUser, @ModificationDate
        );

        SET @PersonaID = SCOPE_IDENTITY();
    END

    -- Insertar el empleado
    INSERT INTO Employee (
        BusinessID, PersonaID, Workstation, IsActive,
        CreateUser, CreateDate, ModificationUser, ModificationDate
    )
    VALUES (
        @BusinessID, @PersonaID, @Puesto, @IsActive,
        @CreateUser, @CreateDate, @ModificationUser, @ModificationDate
    );
END
GO
