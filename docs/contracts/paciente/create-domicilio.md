## Crear domicilio de paciente

Nombre procedimiento: `INT_TEI_Paciente_CreateDomicilio`

Descripción:

Crea un domicilio para un paciente. Devuelve el identificador interno del domicilio creado.

- Espere un error con `state = 40` si el paciente no existe.
- Espere un error con `state = 41` si el procedimiento determina que el paciente ya posee el domicilio que intenta crear.
- Espere un error con `state = 42` si la comuna no pertenece a la provincia, si la provincia no pertenece a la región, si la región no pertenece a Chile.

### Parámetros

- `idPaciente UNIQUEIDENTIFIER`: El identificador interno del paciente al cual se le creara el domicilio.
- `direccion VARCHAR(???)`: La dirección completa del domicilio del paciente, esto es, nombre de calle, número de casa, piso, departamento, etc.
- `codigoUso 'home' | 'work' | 'temp' | 'old' | 'billing'`: El uso del domicilio, como residencia, trabajo, etc.
- `idCodigoPais UNIQUEIDENTIFIER | NULL`: El identificador interno del país donde se encuentra el domicilio.
- `idCodigoRegion UNIQUEIDENTIFIER | NULL`: El identificador interno de la región donde se encuentra el domicilio.
- `idCodigoProvincia UNIQUEIDENTIFIER | NULL`: El identificador interno de la provincia donde se encuentra el domicilio.
- `idCodigoComuna UNIQUEIDENTIFIER | NULL`: El identificador interno de la comuna donde se encuentra el domicilio.

### Resultado

Si se creó el domicilio, el resultado será una tabla con solo una fila, la cuál tendrá una única columna con el identificador interno del domicilio.

```sql
DECLARE @resultado TABLE (
  id UNIQUEIDENTIFIER
);
```

### Llamada de ejemplo

```sql
/* Crear domicilio para un paciente con residencia temporal en la región de Antofagasta (se desconoce la provincia y comuna). */
EXECUTE INT_TEI_Paciente_CreateDomicilio
  @idPaciente = 'ID_INTERNO_PACIENTE',
  @direccion = 'Avenida Pedro Aguirre Cerda #123',
  @codigoUso = 'temp'
  @idCodigoPais = 'ID_INTERNO_PAIS_CHILE',
  @idCodigoRegion = 'ID_INTERNO_REGION_ANTOFAGASTA',
  @idCodigoProvincia = NULL,
  @idCodigoComuna = NULL;

/* Crear domicilio para paciente con residencia en Paraguay. */
EXECUTE INT_TEI_Paciente_CreateDomicilio
  @idPaciente = 'ID_INTERNO_PACIENTE',
  @direccion = 'Calle Rivadavia #2948, block B, piso 2, departamento 303',
  @codigoUso = 'home'
  @idCodigoPais = 'ID_INTERNO_PAIS_PARAGUAY',
  @idCodigoRegion = NULL,
  @idCodigoProvincia = NULL,
  @idCodigoComuna = NULL;
```
