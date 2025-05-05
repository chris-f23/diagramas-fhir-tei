USE [BD_ENTI_CORPORATIVA]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_CreateIdentifier
  @idPacienteExtendido UNIQUEIDENTIFIER,
  @valor VARCHAR(64),
  @uso VARCHAR(10) = NULL,
  @codigoPaisEmisorDocumento CHAR(3),
  @codigoTipoIdentificador CHAR(2)
AS
BEGIN
  SET NOCOUNT ON;

  IF NOT EXISTS (SELECT TOP (1)
    1
  FROM dbo.PAC_PacienteExtendido
  WHERE Id = @idPacienteExtendido) BEGIN
    DECLARE @idPacienteVarchar VARCHAR(36) = (SELECT CAST(@idPacienteExtendido AS VARCHAR(36)));
    RAISERROR('No se encontró el paciente con el identificador interno "%s"', 16, 40, @idPacienteVarchar);
    RETURN 1;
  END

  DECLARE @resultado TABLE (id UNIQUEIDENTIFIER);

  INSERT INTO dbo.PAC_PacienteExtendido_Identificador
    (IdPacienteExtendido, Valor, Uso, CodigoPaisEmisorDocumento, CodigoTipoIdentificador)
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES
    (@idPacienteExtendido, @valor, @uso, @codigoPaisEmisorDocumento, @codigoTipoIdentificador);

  SELECT id
  FROM @resultado;
END
GO