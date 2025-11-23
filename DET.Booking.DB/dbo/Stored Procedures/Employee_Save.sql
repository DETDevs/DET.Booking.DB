CREATE PROCEDURE [dbo].[Employee_Save]
    @PersonID INT,
    @BusinessID INT,
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @Puesto BIGINT,
    @CreateUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CreateDate DATETIME = GETDATE();
    DECLARE @IsActive BIT = 1;

    IF @PersonID IS NULL
    BEGIN
		-- Si PersonID es NULL, asignamos un nuevo ID
		SET @PersonID = 0;
	END

    -- Si no existe, insertarmos
   IF NOT EXISTS (SELECT 1 FROM Person WHERE PersonID = @PersonID)
    BEGIN
        INSERT INTO Person (
            [Name], [Email], [PhoneNumber], [IsActive],
            [CreateUser], [CreateDate], [ModificationUser], [ModificationDate]
        )
        VALUES (
            @Name, @Email, @PhoneNumber, @IsActive,
            @CreateUser, @CreateDate, NULL, NULL
        );

        SET @PersonID = SCOPE_IDENTITY();

          -- Insertar el empleado
        INSERT INTO Employee (
            BusinessID, PersonaID, Workstation, IsActive,
            CreateUser, CreateDate, ModificationUser, ModificationDate
        )
        VALUES (
            @BusinessID, @PersonID, @Puesto, @IsActive,
            @CreateUser, @CreateDate, NULL, NULL
        );
    END
    ELSE
    BEGIN

        MERGE INTO dbo.Person AS target
        USING 
        (
            VALUES (@PersonID, @Name, @Email, @PhoneNumber, @IsActive, @CreateUser, @CreateDate, NULL, NULL)
        ) AS Source 
        (
		    PersonID, [Name], Email, PhoneNumber, IsActive, CreateUser, CreateDate, ModificationUser, ModificationDate
	    )
        ON target.PersonID = Source.PersonID
	    WHEN MATCHED THEN
		    UPDATE SET 
			    target.Name = CASE WHEN Source.Name IS NOT NULL THEN Source.Name ELSE target.Name END,
                target.Email = CASE WHEN Source.Email IS NOT NULL THEN Source.Email ELSE target.Email END,
                target.PhoneNumber = CASE WHEN Source.PhoneNumber IS NOT NULL THEN Source.PhoneNumber ELSE target.PhoneNumber END,
                target.IsActive = CASE WHEN Source.IsActive IS NOT NULL THEN Source.IsActive ELSE target.IsActive END,
                target.ModificationUser = Source.CreateUser,
                target.ModificationDate = Source.CreateDate;

    END

END
GO
