CREATE TABLE [dbo].[Employee]
(
	[EmployeeID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[BusinessID] INT NOT NULL,
    [PersonaID] INT NOT NULL,
    [Puesto] BIGINT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR(100) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(100) NOT NULL,
    [ModificationDate] DATETIME NOT NULL
);
GO
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Persona
    FOREIGN KEY (PersonaID) REFERENCES Person(PersonID);