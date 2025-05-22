CREATE TABLE [dbo].[EmployeeSchedule]
(
	[EmployeeScheduleID] INT PRIMARY KEY IDENTITY,
    [EmployeeID] INT NOT NULL,
    [Dia] INT NOT NULL, -- 1 = domingo, 2 = lunes, etc.
    [HoraInicio] TIME NOT NULL,
    [HoraFin] TIME NOT NULL,
    [Estado] BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)
