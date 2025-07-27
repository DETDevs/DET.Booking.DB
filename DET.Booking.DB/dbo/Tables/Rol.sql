CREATE TABLE [dbo].[Rol]
(
	[RolID] INT NOT NULL PRIMARY KEY,
	[RolName] NVARCHAR(50) NOT NULL,
	[RolDescription] NVARCHAR(255) NOT NULL,
	[RolStatus] NVARCHAR(50) NOT NULL,
	[CreateUser] VARCHAR(MAX) NOT NULL,
	[CreateDate] DATETIME NOT NULL,
	[ModificationUser] VARCHAR(MAX) NULL,
	[ModificationDate] DATETIME NULL
)
