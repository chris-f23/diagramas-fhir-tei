USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

CREATE OR ALTER PROCEDURE dbo.INT_TEI_Paciente_Create
  /* Indica si el paciente pertenece a algún pueblo originario. */
  @perteneceAPuebloOriginario BIT,
  /* Indica si el paciente pertenece a algun pueblo afrodescendiente. */
  @perteneceAPuebloAfrodescendiente BIT = NULL,
  /* El nombre oficial del paciente. */
  @nombreOficial VARCHAR(50) = NULL,
  /* El apellido paterno del paciente. */
  @apellidoPaterno VARCHAR(50),
  /* El apellido materno del paciente. */
  @apellidoMaterno VARCHAR(50),
  /* El nombre social del paciente. */
  @nombreSocial VARCHAR(50) = NULL,
  /* La fecha de nacimiento del paciente. */
  @fechaNacimiento DATETIME,
  /* La fecha de fallecimiento del paciente. */
  @fechaFallecimiento DATETIME = NULL,
  /* El identificador interno del código de identidad del género del paciente. */
  @idIdentidadGenero INTEGER,
  /* El identificador interno del sexo bíologico del paciente. */
  @idSexoBiologico INTEGER = NULL,
  /* El identificador interno del sexo administrativo del paciente. */
  @idSexoAdministrativo INTEGER,
  /* El identificador interno del código nacionalidad del paciente. */
  @idNacionalidad INTEGER,
  /* El identificador interno del código de país de origen del paciente. */
  @idPaisOrigen INTEGER,
  /* El identificador interno del código de religión del paciente. */
  @idReligion INTEGER = NULL,
  /* El identificador interno del código de pueblo originario del paciente. */
  @idPuebloOriginario INTEGER = NULL,
  /* El identificador interno del código de estado civil del paciente. */
  @idEstadoCivil INTEGER = NULL
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @resultado TABLE (id UNIQUEIDENTIFIER);

  INSERT INTO dbo.Paciente
  (
    PerteneceAPuebloOriginario
    ,PerteneceAPuebloAfrodescendiente
    ,NombreOficial
    ,ApellidoPaterno
    ,ApellidoMaterno
    ,NombreSocial
    ,FechaNacimiento
    ,FechaFallecimiento
    ,IdIdentidadGenero
    ,IdSexoBiologico
    ,IdSexoAdministrativo
    ,IdNacionalidad
    ,IdPaisOrigen
    ,IdReligion
    ,IdPuebloOriginario
    ,IdEstadoCivil
  )
  OUTPUT INSERTED.Id INTO @resultado(id)
  VALUES
  (
    @perteneceAPuebloOriginario
    ,@perteneceAPuebloAfrodescendiente
    ,@nombreOficial
    ,@apellidoPaterno
    ,@apellidoMaterno
    ,@nombreSocial
    ,@fechaNacimiento
    ,@fechaFallecimiento
    ,@idIdentidadGenero
    ,@idSexoBiologico
    ,@idSexoAdministrativo
    ,@idNacionalidad
    ,@idPaisOrigen
    ,@idReligion
    ,@idPuebloOriginario
    ,@idEstadoCivil
  );

  SELECT id FROM @resultado;
END
GO