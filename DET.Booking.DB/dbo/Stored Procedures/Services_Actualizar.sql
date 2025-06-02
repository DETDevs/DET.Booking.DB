CREATE PROCEDURE [dbo].[Services_ActualizarDinamico]
    @ServiceID INT,
    @BusinessID INT = NULL,
    @EmployeeID INT = NULL,
    @Name VARCHAR(100) = NULL,
    @Description VARCHAR(500) = NULL,
    @DutarionMin VARCHAR(10) = NULL,
    @Price VARCHAR(20) = NULL,
    @DiasHabiles VARCHAR(50) = NULL,
    @IsActive BIT = NULL,
    @ModificationUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar existencia del servicio
        IF NOT EXISTS (SELECT 1 FROM Services WHERE ServiceID = @ServiceID)
        BEGIN
            RAISERROR('El servicio especificado no existe.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -- Actualización dinámica
        UPDATE Services
        SET
            BusinessID = ISNULL(@BusinessID, BusinessID),
            EmployeeID = ISNULL(@EmployeeID, EmployeeID),
            Name = ISNULL(@Name, Name),
            Description = ISNULL(@Description, Description),
            DutarionMin = ISNULL(@DutarionMin, DutarionMin),
            Price = ISNULL(@Price, Price),
            DiasHabiles = ISNULL(@DiasHabiles, DiasHabiles),
            IsActive = ISNULL(@IsActive, IsActive),
            ModificationUser = @ModificationUser,
            ModificationDate = GETDATE()
        WHERE ServiceID = @ServiceID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;
