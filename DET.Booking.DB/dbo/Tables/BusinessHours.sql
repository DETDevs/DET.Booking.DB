CREATE TABLE [dbo].[BusinessHours]
(
	[BusinessHoursID] INT NOT NULL,
	[BusinessID] INT NOT NULL PRIMARY KEY,
	[DayOfWeek] VARCHAR(10) NOT NULL,
    [OpeningTime] TIME NOT NULL,
    [ClosingTime] TIME NOT NULL,
    [IsOpen] BIGINT NOT NULL,
    [Notes] VARCHAR(255),
    [IsActive] BIT NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
