CREATE TABLE [dbo].[Services]
(
    [ServiceID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [BusinessID] INT NOT NULL,
    [EmployeeID] INT NOT NULL,
	[Name] VARCHAR NOT NULL,
    [Description] VARCHAR NOT NULL,
    [DutarionMin] VARCHAR NOT NULL,
    [Price] VARCHAR NOT NULL,
    [DiasHabiles] VARCHAR NOT NULL,
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(50) NOT NULL,
    [ModificationDate] DATETIME NOT NULL
);
GO
ALTER TABLE Services
ADD CONSTRAINT FK_Services_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE Services
ADD CONSTRAINT FK_Services_Employee
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);