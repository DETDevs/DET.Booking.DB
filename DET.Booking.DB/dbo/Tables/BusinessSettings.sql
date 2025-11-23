CREATE TABLE [dbo].[BusinessSettings]
(
    [SettingID] INT IDENTITY(1,1) PRIMARY KEY,
    [BusinessID] INT NOT NULL,
    [Key] VARCHAR(100) NOT NULL,         -- Ej: 'FormularioRegistro', 'ColorBoton'
    [Value] NVARCHAR(MAX) NOT NULL,      -- Puede ser JSON o un texto simple
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreateUser] VARCHAR(50) NOT NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModificationUser] VARCHAR(50) NULL,
    [ModificationDate] DATETIME NULL,
    
    CONSTRAINT FK_BusinessSettings_Business
        FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID)
)