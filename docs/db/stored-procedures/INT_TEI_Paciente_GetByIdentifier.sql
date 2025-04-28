USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE [dbo].[INT_TEI_Paciente_GetByIdentifier]
  @valor VARCHAR(100),
  @sistemaTipoIdentificador VARCHAR(300),
  @codigoTipoIdentificador VARCHAR(20)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @idTipoIdentificador BIGINT;

  SET @idTipoIdentificador = (
    SELECT TOP(1) Id
    FROM [dbo].[ValueSet_TipoIdentificador]
    WHERE Codigo = @codigoTipoIdentificador AND Sistema = @sistemaTipoIdentificador
  );

  IF (@idTipoIdentificador IS NULL) BEGIN
    RAISERROR('No se encontró el tipo de identificador con código "%s" y sistema "%s"', 16, 40, @codigoTipoIdentificador, @sistemaTipoIdentificador);
    RETURN 1;
  END

  DECLARE @idPaciente UNIQUEIDENTIFIER;

  SET @idPaciente = (
    SELECT TOP(1)
      idpac.IdPaciente AS 'id'
    FROM [dbo].[IdentificadorPaciente] idpac
    WHERE
      1 = 1
      AND idpac.IdTipoIdentificador = @idTipoIdentificador
  );

  IF (@idPaciente IS NULL) BEGIN
    RAISERROR('No se encontró el paciente', 16, 44);
    RETURN 1;
  END

  SELECT @idPaciente AS 'id';
END
