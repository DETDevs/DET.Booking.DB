CREATE PROCEDURE [dbo].[sp_Services_Listar]
    @BusinessID INT = NULL,
    @EmployeeID INT = NULL,
    @IsActive BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        s.ServiceID,
        s.BusinessID,
        b.Name AS BusinessName,
        s.EmployeeID,
        e.Name AS EmployeeName,
        s.Name AS ServiceName,
        s.Description,
        s.DutarionMin,
        s.Price,
        s.DiasHabiles,
        s.IsActive,
        s.CreateUser,
        s.CreateDate,
        s.ModificationUser,
        s.ModificationDate
    FROM Services s
    INNER JOIN Business b ON s.BusinessID = b.BusinessID
    INNER JOIN Employee e ON s.EmployeeID = e.EmployeeID
    WHERE (@BusinessID IS NULL OR s.BusinessID = @BusinessID)
      AND (@EmployeeID IS NULL OR s.EmployeeID = @EmployeeID)
      AND (@IsActive IS NULL OR s.IsActive = @IsActive)
    ORDER BY s.Name;
END;
