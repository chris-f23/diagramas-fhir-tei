## Crear paciente

Nombre procedimiento: `INT_TEI_Paciente_Create`

Descripción:

Crea la información básica de un paciente dados los parámetros entregados. Devuelve el identificador interno del paciente.

### Parámetros

- `perteneceAPuebloOriginario BIT`: Indica si el paciente pertenece a algún pueblo originario.
- `perteneceAPuebloAfrodescendiente BIT | NULL`: Indica si el paciente pertenece a algun pueblo afrodescendiente.
- `nombreOficial VARCHAR(???) | NULL`: El nombre oficial del paciente.
- `apellidoPaterno VARCHAR(???)`: El apellido paterno del paciente.
- `apellidoMaterno VARCHAR(???)`: El apellido materno del paciente.
- `nombreSocial VARCHAR(???) | NULL`: El nombre social del paciente.
- `fechaNacimiento DATETIME`: La fecha de nacimiento del paciente.
- `fechaFallecimiento DATETIME | NULL`: La fecha de fallecimiento del paciente.
- `idCodigoIdentidadGenero UUID`: El identificador interno del código de identidad del género del paciente.
- `idCodigoSexoBiologico UUID | NULL`: El identificador interno del sexo bíologico del paciente.
- `idCodigoSexoAdministrativo UUID`: El identificador interno del sexo administrativo del paciente.
- `idCodigoNacionalidad UUID`: El identificador interno del código nacionalidad del paciente.
- `idCodigoPaisOrigen UUID`: El identificador interno del código de país de origen del paciente.
- `idCodigoReligion UUID | NULL`: El identificador interno del código de religión del paciente.
- `idCodigoPuebloOriginario UUID | NULL`: El identificador interno del código de pueblo originario del paciente.
- `idCodigoEstadoCivil UUID | NULL`: El identificador interno del código de estado civil del paciente.

### Resultado

Si se creó al paciente, el resultado será una tabla con solo una fila, la cuál tendrá una única columna con el identificador interno del paciente.

```sql
DECLARE @resultado TABLE (
  id UNIQUEIDENTIFIER
);
```

### Llamada de ejemplo

```sql
/* Crea a un paciente. */
EXECUTE INT_TEI_Paciente_Create
  @perteneceAPuebloOriginario = 1,
  @perteneceAPuebloAfrodescendiente = NULL,
  @nombreOficial = 'Pedro',
  @apellidoPaterno = 'Gonzalez',
  @apellidoMaterno = 'Garcia',
  @nombreSocial = NULL,
  @fechaNacimiento = '2000-01-01',
  @fechaFallecimiento = NULL,
  @idCodigoIdentidadGenero = 'ID_CODIGO_IDENTIDAD_GENERO_MASCULINO',
  @idCodigoSexoBiologico = NULL,
  @idCodigoSexoAdministrativo = 'ID_CODIGO_SEXO_ADMINISTRATIVO_MASCULINO',
  @idCodigoNacionalidad = 'ID_CODIGO_NACIONALIDAD_CHILENA',
  @idCodigoPaisOrigen = 'ID_CODIGO_PAIS_CHILE',
  @idCodigoReligion = NULL,
  @idCodigoPuebloOriginario = NULL,
  @idCodigoEstadoCivil = 'ID_CODIGO_ESTADO_CIVIL_SOLTERO';
```
