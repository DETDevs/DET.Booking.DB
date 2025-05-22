CREATE PROCEDURE [dbo].[sp_ListAvailableSchedulesForService]
	@ServiceID INT,
    @Fecha DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener EmployeeID y duración del servicio
    DECLARE @EmployeeID INT;
    DECLARE @DuracionMin INT;

    SELECT 
        @EmployeeID = EmployeeID,
        @DuracionMin = TRY_CAST(DutarionMin AS INT)
    FROM Services
    WHERE ServiceID = @ServiceID;

    IF @EmployeeID IS NULL OR @DuracionMin IS NULL
    BEGIN
        RAISERROR('Servicio no encontrado o duración inválida.', 16, 1);
        RETURN;
    END

    -- Día de la semana (1=domingo,...)
    SET DATEFIRST 7; -- domingo=1
    DECLARE @DiaSemana INT = DATEPART(WEEKDAY, @Fecha);

    -- Obtener horarios disponibles del empleado para ese día
    SELECT *
    INTO #Horario
    FROM EmployeeSchedule
    WHERE EmployeeID = @EmployeeID 
      AND Dia = @DiaSemana
      AND Estado = 1;

    IF NOT EXISTS (SELECT 1 FROM #Horario)
    BEGIN
        DROP TABLE #Horario;
        RAISERROR('No hay horarios disponibles para el empleado este día.', 16, 1);
        RETURN;
    END

    -- Generar cupos usando la función fn_GenerarCupos (hora inicio, hora fin, duración del cupo)
    SELECT 
        Cupos.HoraDesde,
        Cupos.HoraHasta
    FROM #Horario h
    CROSS APPLY dbo.fn_GenerarCupos(h.HoraInicio, h.HoraFin, @DuracionMin) AS Cupos
    WHERE NOT EXISTS (
        SELECT 1
        FROM Reservations r
        WHERE r.EmployeeID = @EmployeeID
          AND r.ServiceID = @ServiceID
          AND r.Fecha = @Fecha
          AND r.Hora = Cupos.HoraDesde
    )
    ORDER BY Cupos.HoraDesde;

    DROP TABLE #Horario;
END;