CREATE TABLE [dbo].[Business]
(
	[BusinessID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] VARCHAR(100) NOT NULL,
    [Code] VARCHAR(50) NOT NULL,
    [PrimaryColor] VARCHAR(20) NOT NULL,
    [SecondColor] VARCHAR(20) NOT NULL,
    [Logo] VARCHAR(255) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModificationUser] VARCHAR(50) NULL,
    [ModificationDate] DATETIME NULL
)
