CREATE TABLE [dbo].[User]
(
	[UsuarioID] INT NOT NULL,
    [BusinessID] INT NOT NULL,
    [PersonID] INT NOT NULL,
    [RolID] INT NOT NULL,
    [ContraseñaHash] VARCHAR(255) NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
GO
ALTER TABLE [User]
ADD CONSTRAINT FK_User_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE [User]
ADD CONSTRAINT FK_User_Person
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID);
GO
ALTER TABLE [User]
ADD CONSTRAINT FK_User_Rol
    FOREIGN KEY (RolID) REFERENCES Rol(RolID);