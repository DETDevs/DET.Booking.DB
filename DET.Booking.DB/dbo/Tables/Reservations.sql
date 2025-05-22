CREATE TABLE [dbo].[Reservations]
(
    [ReservationID] INT IDENTITY(1,1) PRIMARY KEY,
    [EmployeeID] INT NOT NULL,
    [ServiceID] INT NOT NULL,
    [Fecha] DATE NOT NULL,
    [Hora] TIME NOT NULL,
    [Cliente] NVARCHAR(100) NULL, -- opcional, por ejemplo nombre del cliente
    [Estado] BIT NOT NULL DEFAULT 1, -- 1 = activo, 0 = cancelado
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModificationUser] VARCHAR(50) NULL,
    [ModificationDate] DATETIME NULL,
    CONSTRAINT FK_Reservations_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_Reservations_Service FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
