CREATE PROCEDURE [dbo].[sp_Services_Guardar]
    @BusinessID INT,
    @EmployeeID INT,
    @Name VARCHAR(100),
    @Description VARCHAR(500),
    @DutarionMin VARCHAR(10),
    @Price VARCHAR(20),
    @DiasHabiles VARCHAR(50),
    @IsActive BIT,
    @CreateUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar que exista el negocio
        IF NOT EXISTS (SELECT 1 FROM Business WHERE BusinessID = @BusinessID)
        BEGIN
            RAISERROR('El negocio especificado no existe.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -- Verificar que exista el empleado
        IF NOT EXISTS (SELECT 1 FROM Employee WHERE EmployeeID = @EmployeeID)
        BEGIN
            RAISERROR('El empleado especificado no existe.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -- Insertar servicio
        INSERT INTO Services (
            BusinessID,
            EmployeeID,
            Name,
            Description,
            DutarionMin,
            Price,
            DiasHabiles,
            IsActive,
            CreateUser,
            CreateDate,
            ModificationUser,
            ModificationDate
        )
        VALUES (
            @BusinessID,
            @EmployeeID,
            @Name,
            @Description,
            @DutarionMin,
            @Price,
            @DiasHabiles,
            @IsActive,
            @CreateUser,
            GETDATE(),
            @CreateUser,
            GETDATE()
        );

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
