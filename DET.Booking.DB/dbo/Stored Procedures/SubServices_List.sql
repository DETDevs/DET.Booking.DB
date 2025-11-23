CREATE PROCEDURE [dbo].[SubServices_List]
	 @ServiceID INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		ss.SubServiceID,
		ss.ServiceID,
		s.Name AS ServiceName,
		ss.Name AS SubServiceName,
		ss.Description,
		ss.DurationMin,
		ss.Price,
		ss.IsActive,
		ss.CreateUser,
		ss.CreateDate,
		ss.ModificationUser,
		ss.ModificationDate
	FROM SubServices ss
	INNER JOIN Services s ON ss.ServiceID = s.ServiceID
	WHERE (@ServiceID IS NULL OR @ServiceID = 0 OR ss.ServiceID = @ServiceID)
	ORDER BY ss.Name;
END;