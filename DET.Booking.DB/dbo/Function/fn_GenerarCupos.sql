CREATE FUNCTION dbo.fn_GenerarCupos
(
    @HoraInicio TIME,
    @HoraFin TIME,
    @DuracionMinutos INT
)
RETURNS TABLE
AS
RETURN
(
    WITH Horas AS
    (
        SELECT CAST(@HoraInicio AS DATETIME) AS HoraDesde
        UNION ALL
        SELECT DATEADD(MINUTE, @DuracionMinutos, HoraDesde)
        FROM Horas
        WHERE DATEADD(MINUTE, @DuracionMinutos, HoraDesde) < CAST(@HoraFin AS DATETIME)
    )
    SELECT 
        CAST(HoraDesde AS TIME) AS HoraDesde,
        CAST(DATEADD(MINUTE, @DuracionMinutos, HoraDesde) AS TIME) AS HoraHasta
    FROM Horas
);
