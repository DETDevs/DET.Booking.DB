
--TODO: Importante validar los horarios al verificar si el empleado está disponible para la reserva (dia, cupo) ****************************************************.

CREATE PROCEDURE [dbo].[Reservation_Insert]
	@PersonName NVARCHAR(100),
    @PersonEmail NVARCHAR(100),
    @PersonPhoneNumber NVARCHAR(20),
    @CreateUserCustomer VARCHAR(50),
    @EmployeeID INT,
    @ServiceID INT,
    @Date DATE,
    @Hour TIME,
    @CreateUserReservation VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @PersonID INT;
        DECLARE @CustomerID INT;

        -- 1. Verificar si la persona existe (por email)
        SELECT @PersonID = PersonID 
        FROM Person 
        WHERE Email = @PersonEmail;

        -- 2. Si no existe, insertar persona
        IF @PersonID IS NULL
        BEGIN
            INSERT INTO Person (Name, Email, PhoneNumber, IsActive, CreateUser, CreateDate)
            VALUES (@PersonName, @PersonEmail, @PersonPhoneNumber, 1, @CreateUserCustomer, GETDATE());

            SET @PersonID = SCOPE_IDENTITY();
        END

        -- 3. Verificar si existe cliente con esta persona
        SELECT @CustomerID = CustomerID 
        FROM Customer 
        WHERE PersonaID = @PersonID;

        -- 4. Si no existe, insertar cliente
        IF @CustomerID IS NULL
        BEGIN
            INSERT INTO Customer (PersonaID, CreateUser, CreateDate)
            VALUES (@PersonID, @CreateUserCustomer, GETDATE());

            SET @CustomerID = SCOPE_IDENTITY();
        END

        -- 5. Insertar reserva
        INSERT INTO Reservations (EmployeeID, ServiceID, Date, Hour, CustomerID, State, CreateUser, CreateDate)
        VALUES (@EmployeeID, @ServiceID, @Date, @Hour, @CustomerID, 1, @CreateUserReservation, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Propagar el error para manejo externo
        THROW;
    END CATCH
END;