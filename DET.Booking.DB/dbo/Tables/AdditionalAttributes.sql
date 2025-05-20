CREATE TABLE [dbo].[AdditionalAttributes]
(
	[AdditionalAttributesID] INT NOT NULL PRIMARY KEY,
	[BusinessID] INT NOT NULL,
	[CustomerID] INT NOT NULL,
	[IsActive] BIT NOT NULL,
	[CreateUser] VARCHAR NOT NULL,
	[CreateDate] VARCHAR NOT NULL,
	[ModificationUser] VARCHAR NOT NULL,
	[ModificationDate] VARCHAR NOT NULL
);
GO
ALTER TABLE AdditionalAttributes
ADD CONSTRAINT FK_AdditionalAttributes_Business
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID);
GO
ALTER TABLE AdditionalAttributes
ADD CONSTRAINT FK_AdditionalAttributes_Customer
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);