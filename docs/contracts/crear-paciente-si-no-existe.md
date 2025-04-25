Al recibir solicitudes de interconsultas desde sistemas externos:

1. Revisar si existe un paciente en PacienteLE con el identificador indicado.
   1.a. Si no existe, crearlo
2. Revisar si existe este mismo paciente en PAC_Paciente,
   2.a. Si existe, vincular mediante PAC_PAC_Numero
   2.b. Si no existe, crear al paciente en PAC_Paciente y vincular mediante PAC_PAC_Numero

Al iniciar una solicitud de interconsulta:

1. Revisar si el paciente existe en PacienteLE
   1.a. Si no existe, crearlo usando los datos de PAC_Paciente
2. Solicitar al usuario que ingrese los datos requeridos por FHIR que no pudieron ser obtenidos automaticamente desde el historico del paciente.

```sql
DECLARE
@idIdentidadGeneroMasculina UNIQUEIDENTIFIER,
@idSexoAdministrativoMasculino UNIQUEIDENTIFIER,
@idPaisChile UNIQUEIDENTIFIER

SELECT @idIdentidadGeneroMasculina = Id
FROM ValueSet_IdentidadGenero
WHERE Codigo = '1' AND Sistema = 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero'

SELECT @idSexoAdministrativoMasculino = Id
FROM ValueSet_GeneroAdministrativo
WHERE Codigo = 'male' AND Sistema = 'http://hl7.org/fhir/administrative-gender'

SELECT @idPaisChile = Id
FROM ValueSet_Pais
WHERE Codigo = '152' AND Sistema = 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais'

EXECUTE INT_TEI_Paciente_Create
@perteneceAPuebloOriginario = 0,
@perteneceAPuebloAfrodescendiente = NULL,
@nombreOficial = 'Juan|Pedro',
@apellidoPaterno = 'Perez',
@apellidoMaterno = 'Lopez',
@nombreSocial = 'Jean|Pierre',
@fechaNacimiento = '2020-01-01',
@fechaFallecimiento = NULL,
@idIdentidadGenero = @idIdentidadGeneroMasculina,
@idSexoAdministrativo = @idSexoAdministrativoMasculino,
@idSexoBiologico = NULL,
@idNacionalidad = @idPaisChile,
@idPaisOrigen = @idPaisChile,
@idReligion = NULL,
@idPuebloOriginario = NULL,
@idEstadoCivil = NULL

-- 4D298983-AE16-467F-83CE-C5FEDAE78FF2
```
