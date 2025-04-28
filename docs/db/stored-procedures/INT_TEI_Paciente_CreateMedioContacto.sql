USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_CreateMedioContacto
  @idPaciente UNIQUEIDENTIFIER,
  @sistema VARCHAR(10),
  @uso VARCHAR(10) = NULL,
  @valor VARCHAR(255),
  @ordenPreferencia INTEGER = NULL
AS
BEGIN
  SET NOCOUNT ON;
  
  IF NOT EXISTS (SELECT TOP (1) 1 FROM dbo.Paciente WHERE Id = @idPaciente) BEGIN
    DECLARE @idPacienteVarchar VARCHAR(36) = (SELECT CAST(@idPaciente AS VARCHAR(36)));
    RAISERROR('No se encontró el paciente con el identificador interno "%s"', 16, 40, @idPacienteVarchar);
    RETURN 1;
  END

  IF EXISTS (
    SELECT TOP (1) 1
    FROM dbo.MedioContactoPaciente
    WHERE
      1= 1
      AND IdPaciente = @idPaciente
      AND Sistema = @sistema
      AND Valor = @valor
  ) BEGIN
    RAISERROR('El medio de contacto ya existe.', 16, 41);
  END

  DECLARE @resultado TABLE (id UNIQUEIDENTIFIER);

  INSERT INTO [dbo].[MedioContactoPaciente] (IdPaciente, Sistema, Uso, Valor, OrdenPreferencia)
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES (
    @idPaciente,
    @sistema,
    @uso,
    @valor,
    @ordenPreferencia
  );

  SELECT id FROM @resultado;
END