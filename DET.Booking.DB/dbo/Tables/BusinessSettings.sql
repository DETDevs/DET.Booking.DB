CREATE TABLE [dbo].[BusinessSettings]
(
	[BusinessID] INT NOT NULL,
	[Key] VARCHAR NOT NULL,
    [Value] VARCHAR NOT NULL,
    [IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
GO
ALTER TABLE BusinessSettings
ADD CONSTRAINT FK_BusinessSettings_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);