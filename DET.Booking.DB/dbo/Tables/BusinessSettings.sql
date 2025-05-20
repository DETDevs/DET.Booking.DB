CREATE TABLE [dbo].[BusinessSettings]
(
	[BusinessID] INT NOT NULL,
	[Key] VARCHAR(255) NOT NULL,
    [Value] VARCHAR(255) NOT NULL,
    [IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [ModificationUser] VARCHAR(50) NOT NULL,
    [ModificationDate] DATETIME NOT NULL
)
GO
ALTER TABLE BusinessSettings
ADD CONSTRAINT FK_BusinessSettings_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);