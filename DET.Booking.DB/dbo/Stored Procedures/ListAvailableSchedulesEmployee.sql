CREATE PROCEDURE [dbo].[ListAvailableSchedulesEmployee]
    @EmployeeID INT,
    @Fecha DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Día de la semana: 1 = domingo, 2 = lunes, ..., 7 = sábado
    SET DATEFIRST 7;
    DECLARE @DiaSemana INT = DATEPART(WEEKDAY, @Fecha);

    -- Obtener duración del servicio más reciente asociado al empleado
    DECLARE @DuracionMin INT;

    SELECT TOP 1 @DuracionMin = TRY_CAST(DutarionMin AS INT)
    FROM Services
    WHERE EmployeeID = @EmployeeID
    ORDER BY CreateDate DESC;

    IF @DuracionMin IS NULL
    BEGIN
        RAISERROR('No se encontró un servicio con duración válida para el empleado.', 16, 1);
        RETURN;
    END

    -- Obtener horario del empleado para ese día
    SELECT *
    INTO #Horario
    FROM EmployeeSchedule
    WHERE EmployeeID = @EmployeeID AND [Day] = @DiaSemana AND [State] = 1;

    IF NOT EXISTS (SELECT 1 FROM #Horario)
    BEGIN
        DROP TABLE #Horario;
        RAISERROR('No hay horarios disponibles para el empleado este día.', 16, 1);
        RETURN;
    END

    -- Devolver cupos disponibles según duración
    SELECT 
        Cupos.HoraDesde,
        Cupos.HoraHasta
    FROM #Horario h
    CROSS APPLY dbo.fn_GenerarCupos(h.[StartTime], h.[EndTime], @DuracionMin) AS Cupos
    WHERE NOT EXISTS (
        SELECT 1
        FROM Reservations r
        WHERE r.EmployeeID = @EmployeeID
          AND r.[Date] = @Fecha
          AND r.[Hour] = Cupos.HoraDesde
    )
    ORDER BY Cupos.HoraDesde;

    DROP TABLE #Horario;
END;
