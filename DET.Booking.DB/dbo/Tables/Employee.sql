CREATE TABLE [dbo].[Employee]
(
	[EmployeeID] INT NOT NULL PRIMARY KEY,
	[BusinessID] INT NOT NULL,
    [PersonaID] INT NOT NULL,
    [Puesto] BIGINT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
);
GO
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Persona
    FOREIGN KEY (PersonaID) REFERENCES Person(PersonID);