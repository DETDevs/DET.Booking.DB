CREATE TABLE [dbo].[AdditionalAttributes]
(
	[AdditionalAttributesID] INT NOT NULL PRIMARY KEY,
	[BusinessID] INT NOT NULL,
	[CustomerID] INT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
	[CreateDate] VARCHAR NOT NULL,
	[ModificationUser] VARCHAR NOT NULL,
	[ModificationDate] VARCHAR NOT NULL
)
