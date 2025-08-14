CREATE PROCEDURE [dbo].[BusinessSettings_Listar]
    @BusinessID INT = NULL,  -- Filtro opcional por negocio
    @Key VARCHAR(100) = NULL -- Filtro opcional por clave
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        BusinessID,
        [Key],
        [Value],
        IsActive,
        CreateUser,
        CreateDate,
        ModificationUser,
        ModificationDate
    FROM BusinessSettings
    WHERE (@BusinessID IS NULL OR BusinessID = @BusinessID)
      AND (@Key IS NULL OR [Key] = @Key)
    ORDER BY BusinessID, [Key];
END;
