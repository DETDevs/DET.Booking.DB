CREATE TABLE [dbo].[Reservations]
(
    [ReservationID] INT IDENTITY(1,1) PRIMARY KEY,
    [EmployeeID] INT NOT NULL,
    [CustomerID] INT NOT NULL,
    [ServiceID] INT NOT NULL,
    [Date] DATE NOT NULL,
    [Hour] TIME NOT NULL,
    [State] INT NOT NULL DEFAULT 1,
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModificationUser] VARCHAR(50) NULL,
    [ModificationDate] DATETIME NULL,
    CONSTRAINT FK_Reservations_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_Reservations_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_Reservations_Service FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
    CONSTRAINT FK_Reservations_ReservationStatus FOREIGN KEY ([State]) REFERENCES [ReservationStatus](StatusID)
);
