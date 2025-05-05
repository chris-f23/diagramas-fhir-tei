USE [BD_ENTI_CORPORATIVA]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_Create
  @numeroPaciente FLOAT,
  @codigoGeneroAdministrativo VARCHAR(10),
  @fechaNacimiento DATETIME,
  @codigoIdentidadGenero CHAR(2),
  @codigoNacionalidad CHAR(3),
  @codigoPaisOrigen CHAR(3),
  @perteneceAPuebloOriginarioChile BIT,
  @estaActivo BIT,

  @nombreSocial VARCHAR(50) = NULL,
  @nombreOficial VARCHAR(50) = NULL,
  @apellidoPaterno VARCHAR(50) = NULL,
  @apellidoMaterno VARCHAR(50) = NULL,
  @fechaFallecimiento DATETIME = NULL,
  @codigoEstadoCivil CHAR(2) = NULL,
  @codigoSexoBiologico VARCHAR(10) = NULL,
  @codigoReligion VARCHAR(2) = NULL,
  @perteneceAPuebloAfrodescendiente BIT = NULL,
  @codigoPuebloOriginarioChile CHAR(2) = NULL,
  /* Propiedades complejas */
  @_generalPractitioner VARCHAR(MAX) = NULL,
  @_link VARCHAR(MAX) = NULL
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @resultado TABLE (id UNIQUEIDENTIFIER);

  INSERT INTO dbo.PAC_PacienteExtendido
    (
    [NumeroPaciente],
    [EstaActivo],
    [NombreSocial],
    [NombreOficial],
    [ApellidoPaterno],
    [ApellidoMaterno],
    [CodigoGeneroAdministrativo],
    [FechaNacimiento],
    [FechaFallecimiento],
    [CodigoEstadoCivil],
    [CodigoIdentidadGenero],
    [CodigoSexoBiologico],
    [CodigoNacionalidad],
    [CodigoPaisOrigen],
    [CodigoReligion],
    [PerteneceAPuebloOriginarioChile],
    [PerteneceAPuebloAfrodescendiente],
    [CodigoPuebloOriginarioChile],
    [_GeneralPractitioner],
    [_Link]
    )
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES
    (
      @numeroPaciente,
      @estaActivo,
      @nombreSocial,
      @nombreOficial,
      @apellidoPaterno,
      @apellidoMaterno,
      @codigoGeneroAdministrativo,
      @fechaNacimiento,
      @fechaFallecimiento,
      @codigoEstadoCivil,
      @codigoIdentidadGenero,
      @codigoSexoBiologico,
      @codigoNacionalidad,
      @codigoPaisOrigen,
      @codigoReligion,
      @perteneceAPuebloOriginarioChile,
      @perteneceAPuebloAfrodescendiente,
      @codigoPuebloOriginarioChile,
      @_generalPractitioner,
      @_link
      );

  SELECT id
  FROM @resultado;
END
GO