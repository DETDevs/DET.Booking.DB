CREATE TABLE [dbo].[Business]
(
	[BusinessID] INT NOT NULL,
    [Name]  VARCHAR NOT NULL,
    [Code] VARCHAR NOT NULL,
    [PrimaryColor] VARCHAR NOT NULL,
    [SecondColor] VARCHAR NOT NULL,
    [Logo] VARCHAR NOT NULL,
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
