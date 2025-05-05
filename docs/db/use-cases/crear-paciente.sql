USE BD_ENTI_CORPORATIVA

BEGIN TRAN T1

DECLARE @numeroPaciente FLOAT;

SET @numeroPaciente = (
    SELECT TOP (1)
  PAC_PAC_Numero
FROM PAC_Paciente
ORDER BY PAC_PAC_Numero DESC
) + 1;

INSERT INTO PAC_Paciente
  (PAC_PAC_Numero)
VALUES
  (@numeroPaciente);

EXEC dbo.INT_TEI_Paciente_Create
  @numeroPaciente = @numeroPaciente,
  @estaActivo = 1,
  @codigoGeneroAdministrativo = 'male',
  @codigoIdentidadGenero = '1', -- Masculino
  @codigoNacionalidad = '152', -- Chileno
  @codigoPaisOrigen = '032', -- Argentina
  @perteneceAPuebloOriginarioChile = 0,
  @fechaNacimiento = '1998-12-30';

COMMIT TRAN T1;

BEGIN TRAN T2;

SET @numeroPaciente += 1;
INSERT INTO PAC_Paciente
  (PAC_PAC_Numero)
VALUES
  (@numeroPaciente);


DECLARE @resultadoCreatePaciente TABLE (id UNIQUEIDENTIFIER);

INSERT INTO @resultadoCreatePaciente
EXEC dbo.INT_TEI_Paciente_Create
  @numeroPaciente = @numeroPaciente,
  @estaActivo = 1,
  @codigoGeneroAdministrativo = 'female',
  @codigoIdentidadGenero = '2', -- Femenino
  @codigoNacionalidad = '152', -- Chileno
  @codigoPaisOrigen = '152', -- Argentina
  @perteneceAPuebloOriginarioChile = 1,
  @fechaNacimiento = '1995-04-21',
  -- Opcionales:
  @nombreSocial = 'Jean|Carmen',
  @nombreOficial = 'Juana|Del Carmen',
  @apellidoPaterno = 'Perez',
  @apellidoMaterno = 'Rodriguez',
  @fechaFallecimiento = NULL,
  @codigoEstadoCivil = '02', -- Casada
  @codigoSexoBiologico = 'female',
  @codigoReligion = '3', -- Testigo de Jehová
  @perteneceAPuebloAfrodescendiente = 0,
  @codigoPuebloOriginarioChile = '07'; -- Diaguita 

DECLARE @idPacienteCreado UNIQUEIDENTIFIER = (SELECT TOP (1) id FROM @resultadoCreatePaciente);

EXEC dbo.INT_TEI_Paciente_CreateIdentifier
  @idPacienteExtendido = @idPacienteCreado,
  @valor = '12345678-9',
  @codigoPaisEmisorDocumento = '152', -- Chile
  @codigoTipoIdentificador = '01'; -- RUN

COMMIT TRAN T2;


SELECT *
FROM PAC_Paciente;


SELECT *
FROM PAC_PacienteExtendido;

SELECT * FROM PAC_PacienteExtendido_Identificador;