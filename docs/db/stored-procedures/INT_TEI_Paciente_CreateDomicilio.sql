USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_CreateDomicilio
  @idPaciente UNIQUEIDENTIFIER,
  @direccion VARCHAR(255),
  @uso VARCHAR(10) = NULL,
  @idPais INTEGER = NULL,
  @idRegion INTEGER = NULL,
  @idProvincia INTEGER = NULL,
  @idComuna INTEGER = NULL
AS
BEGIN
  SET NOCOUNT ON;

  /* TODO: Validar pais, region, provincia y comuna */

  DECLARE @resultado TABLE(id UNIQUEIDENTIFIER);

  INSERT INTO DomicilioPaciente (IdPaciente, Direccion, Uso, IdPais, IdRegion, IdProvincia, IdComuna)
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES (@idPaciente, @direccion, @uso, @idPais, @idRegion, @idProvincia, @idComuna);

  SELECT id FROM @resultado;
END