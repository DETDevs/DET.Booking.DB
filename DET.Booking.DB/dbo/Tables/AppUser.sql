CREATE TABLE [dbo].[AppUser]
(
    [UsuarioID] INT IDENTITY (1, 1) NOT NULL,
    [BusinessID] INT NOT NULL,
    [PersonID] INT NOT NULL,
    [RolID] INT NOT NULL,
    [ContraseñaHash] VARCHAR(255) NOT NULL,
    [CreateUser] VARCHAR(MAX) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(MAX) NULL,
    [ModificationDate] DATETIME NULL
)
GO
ALTER TABLE [AppUser]
ADD CONSTRAINT FK_User_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE [AppUser]
ADD CONSTRAINT FK_User_Person
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID);
GO
ALTER TABLE [AppUser]
ADD CONSTRAINT FK_User_Rol
    FOREIGN KEY (RolID) REFERENCES Rol(RolID);