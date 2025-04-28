USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_CreateIdentifier
  @idPaciente UNIQUEIDENTIFIER,
  @valor VARCHAR(100),
  @uso VARCHAR(100),
  @sistemaTipoIdentificador VARCHAR(100),
  @codigoTipoIdentificador VARCHAR(100),
  @idPaisEmisorDocumento INTEGER
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @idTipoIdentificador INTEGER;

  SET @idTipoIdentificador = (
    SELECT TOP(1) Id
    FROM dbo.ValueSet_TipoIdentificador
    WHERE
      1 = 1
      AND Sistema = @sistemaTipoIdentificador
      AND Codigo = @codigoTipoIdentificador
  );

  IF (@idTipoIdentificador IS NULL) BEGIN
    RAISERROR('No se encontró el tipo de identificador con código "%s" y sistema "%s"', 16, 40, @codigoTipoIdentificador, @sistemaTipoIdentificador);
    RETURN 1;
  END

  IF NOT EXISTS (SELECT TOP (1) 1 FROM dbo.Paciente WHERE Id = @idPaciente) BEGIN
    DECLARE @idPacienteVarchar VARCHAR(36) = (SELECT CAST(@idPaciente AS VARCHAR(36)));
    RAISERROR('No se encontró el paciente con el identificador interno "%s"', 16, 40, @idPacienteVarchar);
    RETURN 1;
  END

  DECLARE @resultado TABLE (id UNIQUEIDENTIFIER);

  INSERT INTO dbo.IdentificadorPaciente (IdPaciente, IdTipoIdentificador, Uso, Valor, IdPaisEmisorDocumento)
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES (@idPaciente, @idTipoIdentificador, @uso, @valor, @idPaisEmisorDocumento);

  SELECT id FROM @resultado;
END
GO