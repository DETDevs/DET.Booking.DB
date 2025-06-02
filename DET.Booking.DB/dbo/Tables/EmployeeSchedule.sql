CREATE TABLE [dbo].[EmployeeSchedule]
(
	[EmployeeScheduleID] INT PRIMARY KEY IDENTITY,
    [EmployeeID] INT NOT NULL,
    [Day] INT NOT NULL, -- 1 = domingo, 2 = lunes, etc.
    [StartTime] TIME NOT NULL,
    [EndTime] TIME NOT NULL,
    [State] BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)
