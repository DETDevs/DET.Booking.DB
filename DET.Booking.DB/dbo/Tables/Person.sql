CREATE TABLE [dbo].[Person]
(
	[PersonID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(100),
    [Email] NVARCHAR(100) UNIQUE,
    [PhoneNumber] NVARCHAR(20),
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR(100) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(100) NULL,
    [ModificationDate] DATETIME NULL
)