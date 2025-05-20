CREATE TABLE [dbo].[User]
(
	[UsuarioID] BIGINT NOT NULL,
    [BusinessID] BIGINT NOT NULL,
    [PersonID] BIGINT NOT NULL,
    [RolID] INT NOT NULL,
    [ContraseñaHash] VARCHAR(255) NOT NULL,
    [CreateUser] VARCHAR NOT NULL,
    [CreateDate] VARCHAR NOT NULL,
    [ModificationUser] VARCHAR NOT NULL,
    [ModificationDate] VARCHAR NOT NULL
)
