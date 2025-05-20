CREATE TABLE [dbo].[Rol]
(
	[RolID] INT NOT NULL PRIMARY KEY,
	[RolName] NVARCHAR(50) NOT NULL,
	[RolDescription] NVARCHAR(255) NOT NULL,
	[RolStatus] NVARCHAR(50) NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
	[CreateDate] VARCHAR NOT NULL,
	[ModificationUser] VARCHAR NOT NULL,
	[ModificationDate] VARCHAR NOT NULL
)
