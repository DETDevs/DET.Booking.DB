CREATE PROCEDURE [dbo].[Business_Listar]
    @IsActive BIT = NULL,
    @Code VARCHAR(50) = NULL -- filtro opcional por código de negocio
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        b.BusinessID,
        b.Name,
        b.Code,
        b.PrimaryColor,
        b.SecondColor,
        b.Logo,
        b.IsActive,
        b.CreateUser,
        b.CreateDate,
        b.ModificationUser,
        b.ModificationDate
    FROM Business b
    WHERE (@IsActive IS NULL OR b.IsActive = @IsActive)
      AND (@Code IS NULL OR b.Code = @Code)
END;
