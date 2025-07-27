CREATE PROCEDURE [dbo].[Reservation_UpdateState]
    @ReservationID INT,
    @NewStateID INT,
    @ModificationUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [dbo].[Reservations]
        SET 
            [State] = @NewStateID,
            [ModificationUser] = @ModificationUser,
            [ModificationDate] = GETDATE()
        WHERE [ReservationID] = @ReservationID;

        IF @@ROWCOUNT = 0
        BEGIN
            THROW 50000, 'No se encontró la reserva con el ID especificado.', 1;
        END

        COMMIT TRANSACTION;

        -- Devolver la reserva actualizada
        SELECT *
        FROM [dbo].[Reservations]
        WHERE [ReservationID] = @ReservationID;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
