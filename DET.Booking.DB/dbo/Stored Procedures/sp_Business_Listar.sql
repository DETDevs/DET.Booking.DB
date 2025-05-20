CREATE PROCEDURE [dbo].[sp_Business_Listar]
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
        b.ModificationDate,
        bs.[Key],
        bs.[Value],
        bs.IsActive AS SettingIsActive,
        bs.CreateUser AS SettingCreateUser,
        bs.CreateDate AS SettingCreateDate,
        bs.ModificationUser AS SettingModificationUser,
        bs.ModificationDate AS SettingModificationDate
    FROM Business b
    LEFT JOIN BusinessSettings bs ON b.BusinessID = bs.BusinessID
    WHERE (@IsActive IS NULL OR b.IsActive = @IsActive)
      AND (@Code IS NULL OR b.Code = @Code)
    ORDER BY b.Name, bs.[Key];
END;
