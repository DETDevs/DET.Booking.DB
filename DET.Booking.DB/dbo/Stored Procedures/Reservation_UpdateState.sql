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

        -- Puedes verificar que la fila se haya actualizado
        IF @@ROWCOUNT = 0
        BEGIN
            -- Si no se actualizó ninguna fila, generamos error para hacer rollback
            THROW 50000, 'No se encontró la reserva con el ID especificado.', 1;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Opcional: puedes devolver el error que ocurrió
        THROW;
    END CATCH
END
