CREATE TABLE [dbo].[BusinessConfigApis]
(
	[BusinessConfigApisID] INT NOT NULL PRIMARY KEY,
	[BusinessID] INT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
GO
ALTER TABLE BusinessConfigApis
ADD CONSTRAINT FK_BusinessConfigApis_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
