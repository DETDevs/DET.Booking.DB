CREATE TABLE [dbo].[Services]
(
    [ServiceID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [BusinessID] INT NOT NULL,
    [EmployeeID] INT NOT NULL,
	[Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(255) NOT NULL,
    [DutarionMin] VARCHAR(10) NOT NULL,
    [Price] VARCHAR(20) NOT NULL,
    [DiasHabiles] VARCHAR(max) NOT NULL,
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