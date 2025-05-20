CREATE TABLE [dbo].[Services]
(
    [ServiceID] INT NOT NULL,
    [BusinessID] INT NOT NULL,
    [EmployeeID] INT NOT NULL,
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
);
GO
ALTER TABLE Services
ADD CONSTRAINT FK_Services_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE Services
ADD CONSTRAINT FK_Services_Employee
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);