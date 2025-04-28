USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_CreateIdentificadorContacto
  @idContactoPaciente UNIQUEIDENTIFIER,
  @sistema VARCHAR(250),
  @valor VARCHAR(250),
  @idPaisEmisorDocumento INTEGER,
  @codingType VARCHAR(MAX) = NULL
AS
BEGIN
  SET NOCOUNT ON;

  IF (@codingType IS NOT NULL) BEGIN
    IF (ISJSON(@codingType) = 0) BEGIN
      RAISERROR('El parámetro @codingType no es un JSON valido', 16, 40);
      RETURN;
    END
  END

  DECLARE @resultado TABLE(id UNIQUEIDENTIFIER);

  INSERT INTO dbo.IdentificadorContactoPaciente (IdContactoPaciente, Sistema, Valor, IdPaisEmisorDocumento, CodingType)
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES (
    @idContactoPaciente,
    @sistema,
    @valor,
    @idPaisEmisorDocumento,
    @codingType
  );

  SELECT id FROM @resultado;
END