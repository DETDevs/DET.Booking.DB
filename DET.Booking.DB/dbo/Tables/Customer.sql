CREATE TABLE [dbo].[Customer]
(
	[CustomerID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [PersonaID] INT NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
);
GO
ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Persona
    FOREIGN KEY (PersonaID) REFERENCES Person(PersonID);