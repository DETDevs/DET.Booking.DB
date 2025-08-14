CREATE TABLE [dbo].[SubServices]
(
    [SubServiceID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ServiceID] INT NOT NULL, -- Servicio padre
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(255) NOT NULL,
    [DurationMin] VARCHAR(10) NOT NULL,
    [Price] VARCHAR(20) NOT NULL,
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(50) NULL,
    [ModificationDate] DATETIME NULL,

    CONSTRAINT FK_SubServices_Services FOREIGN KEY (ServiceID)
        REFERENCES [dbo].[Services](ServiceID)
        ON DELETE CASCADE
);
