CREATE TABLE [dbo].[Customer]
(
	[CustomerID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [PersonaID] INT NOT NULL,
    [CreateUser] VARCHAR(MAX) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(MAX) NULL,
    [ModificationDate] DATETIME NULL
);
GO
ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Persona
    FOREIGN KEY (PersonaID) REFERENCES Person(PersonID);