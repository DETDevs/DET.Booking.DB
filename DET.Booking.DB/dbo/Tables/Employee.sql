CREATE TABLE [dbo].[Employee]
(
	[EmployeeID] INT NOT NULL PRIMARY KEY,
	[BusinessID] BIGINT NOT NULL,
    [PersonaID] BIGINT NOT NULL,
    [Puesto] BIGINT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
