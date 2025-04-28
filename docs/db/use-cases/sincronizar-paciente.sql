USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

DECLARE
  @perteneceAPuebloOriginario BIT = 0,
  @perteneceAPuebloAfrodescendiente BIT = NULL,
  @nombreOficial VARCHAR(50) = 'Juan|Pedro',
  @apellidoPaterno VARCHAR(50) = 'Rojas',
  @apellidoMaterno VARCHAR(50) = 'Rodriguez',
  @nombreSocial VARCHAR(50) = 'Jean|Pierre',
  @fechaNacimiento DATETIME = '2006-01-13',
  @fechaFallecimiento DATETIME = NULL,
  @idIdentidadGenero INTEGER = 1, /* Masculino */
  @idSexoBiologico INTEGER = NULL,
  @idSexoAdministrativo INTEGER = 1, /* Masculino */
  @idNacionalidad INTEGER = 43, /* Chile */
  @idPaisOrigen INTEGER = 174, /* Peru */
  @idReligion INTEGER = 3, /* Testigo de Jehová */
  @idPuebloOriginario INTEGER = NULL,
  @idEstadoCivil INTEGER = 1; /* Soltero */

DECLARE
  @rutPaciente VARCHAR(100) = '1121557-2',
  @direccionResidenciaPaciente VARCHAR(100) = 'Av. Pedro Aguirre Cerda #1234, Piso 2',
  @paisResidenciaPaciente INTEGER = 43; /* Chile */


BEGIN TRANSACTION T1;
DECLARE @resultadoGetPaciente TABLE (id UNIQUEIDENTIFIER);
DECLARE @resultadoCreatePaciente TABLE (id UNIQUEIDENTIFIER);

BEGIN TRY
  INSERT INTO @resultadoGetPaciente
  EXECUTE INT_TEI_Paciente_GetByIdentifier
    @valor = @rutPaciente,
    @sistemaTipoIdentificador = 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador',
    @codigoTipoIdentificador = '01';
END TRY
BEGIN CATCH
  IF (ERROR_STATE() <> 44) THROW
END CATCH

IF NOT EXISTS (SELECT TOP (1) 1 FROM @resultadoGetPaciente) BEGIN
  INSERT INTO @resultadoCreatePaciente
  EXECUTE INT_TEI_Paciente_Create
    @perteneceAPuebloOriginario = @perteneceAPuebloOriginario,
    @perteneceAPuebloAfrodescendiente = @perteneceAPuebloAfrodescendiente,
    @nombreOficial = @nombreOficial,
    @apellidoPaterno = @apellidoPaterno,
    @apellidoMaterno = @apellidoMaterno,
    @nombreSocial = @nombreSocial,
    @fechaNacimiento = @fechaNacimiento,
    @fechaFallecimiento = @fechaFallecimiento,
    @idIdentidadGenero = @idIdentidadGenero,
    @idSexoBiologico = @idSexoBiologico,
    @idSexoAdministrativo = @idSexoAdministrativo,
    @idNacionalidad = @idNacionalidad,
    @idPaisOrigen = @idPaisOrigen,
    @idReligion = @idReligion,
    @idPuebloOriginario = @idPuebloOriginario,
    @idEstadoCivil = @idEstadoCivil;
  
  DECLARE @idPaciente UNIQUEIDENTIFIER = (SELECT TOP (1) id FROM @resultadoCreatePaciente);
  
  EXECUTE INT_TEI_Paciente_CreateIdentifier
    @idPaciente = @idPaciente,
    @valor = @rutPaciente,
    @sistemaTipoIdentificador = 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador',
    @codigoTipoIdentificador = '01';

  EXECUTE INT_TEI_Paciente_CreateMedioContacto
    @idPaciente = @idPaciente,
    @valor = '+569 9999 9999',
    @sistema = 'phone',
    @uso = 'mobile';

  EXECUTE INT_TEI_Paciente_CreateMedioContacto
    @idPaciente = @idPaciente,
    @valor = 'juan.rojas.rodriguez@acme.com',
    @sistema = 'email',
    @uso = 'work';

  EXECUTE INT_TEI_Paciente_CreateDomicilio
    @idPaciente = @idPaciente,
    @uso = 'home',
    @direccion = @direccionResidenciaPaciente,
    @idPais = @paisResidenciaPaciente;
END
COMMIT TRANSACTION T1;