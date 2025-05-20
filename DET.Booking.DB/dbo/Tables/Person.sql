CREATE TABLE [dbo].[Person]
(
	[PK_Person] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(100),
    [Email] NVARCHAR(100) UNIQUE,
    [PhoneNumber] NVARCHAR(20),
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
