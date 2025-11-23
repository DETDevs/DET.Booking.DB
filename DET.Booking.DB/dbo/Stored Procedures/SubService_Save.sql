CREATE PROCEDURE [dbo].[SubService_Save]
    @ServiceID INT,
    @Name VARCHAR(100),
    @Description VARCHAR(255),
    @DurationMin VARCHAR(10),
    @Price VARCHAR(20),
    @IsActive BIT,
    @CreateUser VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[SubServices] (
        ServiceID,
        Name,
        Description,
        DurationMin,
        Price,
        IsActive,
        CreateUser,
        CreateDate
    )
    VALUES (
        @ServiceID,
        @Name,
        @Description,
        @DurationMin,
        @Price,
        @IsActive,
        @CreateUser,
        GETDATE()
    );
END;