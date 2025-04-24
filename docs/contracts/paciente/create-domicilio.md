## Crear domicilio de paciente

Nombre procedimiento: `INT_TEI_Paciente_CreateDomicilio`

Descripción:

Crea un domicilio para un paciente. Devuelve el identificador interno del domicilio creado.

- Espere un error con `state = 40` si el paciente no existe.
- Espere un error con `state = 41` si el procedimiento determina que el paciente ya posee el domicilio que intenta crear.

### Parámetros

- `idPaciente UNIQUEIDENTIFIER`: El identificador interno del paciente al cual se le creara el domicilio.
- `direccion VARCHAR(???)`: La dirección completa del domicilio del paciente, esto es, nombre de calle, número de casa, piso, departamento, etc.
- `codigoUso 'home' | 'work' | 'temp' | 'old' | 'billing'`: El uso del domicilio, como residencia, trabajo, etc.

### Resultado

Si se creó al paciente, el resultado será una tabla con solo una fila, la cuál tendrá una única columna con el identificador interno del domicilio.

```sql
DECLARE @resultado TABLE (
  id UNIQUEIDENTIFIER
);
```

### Llamada de ejemplo

```sql
/* Crear domicilio para un paciente. */
EXECUTE INT_TEI_Paciente_CreateDomicilio
  @idPaciente = 'ID_INTERNO_PACIENTE',
  @direccion = 'Avenida Pedro Aguirre Cerda #123',
  @codigoUso = 'home';
```
