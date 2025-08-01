CREATE PROCEDURE [dbo].[Employee_Listar]
	@EmployeeID INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		e.EmployeeID,
		e.BusinessID,
		b.Name AS BusinessName,
		p.Name AS EmployeeName,
		p.Email AS EmployeeEmail,
		p.PhoneNumber AS EmployeePhoneNumber,
		e.Workstation,
		e.IsActive,
		e.CreateUser,
		e.CreateDate,
		e.ModificationUser,
		e.ModificationDate
	FROM Employee e
	INNER JOIN Business b ON e.BusinessID = b.BusinessID
	INNER JOIN Person p ON e.PersonaID = p.PersonID
	WHERE e.EmployeeID = @EmployeeID
	ORDER BY p.Name;
END;