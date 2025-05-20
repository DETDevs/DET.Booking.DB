CREATE TABLE [dbo].[Services]
(
    [ServiceID] BIGINT NOT NULL,
    [BusinessID] VARCHAR NOT NULL,
    [EmployeeID] VARCHAR NOT NULL,
	[Name] VARCHAR NOT NULL,
    [Description] VARCHAR NOT NULL,
    [DutarionMin] VARCHAR NOT NULL,
    [Price] VARCHAR NOT NULL,
    [DiasHabiles] VARCHAR NOT NULL,
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
