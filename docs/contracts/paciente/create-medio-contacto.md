## Crear medio de contacto de paciente

Nombre procedimiento: `INT_TEI_Paciente_CreateMedioContacto`

Descripción:

Crea un medio de contacto para un paciente existente. Devuelve el identificador interno del medio de contacto creado.

- Espere un error con `state = 40` si el paciente no existe.
- Espere un error con `state = 41` si el procedimiento determina que el paciente ya posee el medio de contacto que intenta crear.

### Parámetros

- `idPaciente UNIQUEIDENTIFIER`: El identificador interno del paciente al cual se le creara el medio de contacto.
- `codigoSistema 'phone' | 'email'`: El código que indica el tipo de medio de contacto.
- `codigoUso 'home' | 'work' | 'temp' | 'old' | 'mobile' | NULL`: El código que indica el uso del medio de contacto.
- `valor`: El valor del medio de contacto.
- `ordenPreferencia INTEGER | NULL`: La preferencia de orden del medio de contacto. 1 es preferido, 2 es secundario, etc (POR CONFIRMAR).

### Resultado

Si se creó el medio de contacto, el resultado será una tabla con solo una fila, la cuál tendrá una única columna con el identificador interno del domicilio.

```sql
DECLARE @resultado TABLE (
  id UNIQUEIDENTIFIER
);
```

### Llamada de ejemplo

```sql
/* Agregar telefono de casa de paciente. */
EXECUTE INT_TEI_Paciente_CreateMedioContacto
  @idPaciente = 'ID_INTERNO_PACIENTE',
  @codigoSistema = 'phone',
  @codigoUso = 'home',
  @valor = '1234567890',
  @ordenPreferencia = 2;

/* Agregar correo de trabajo de paciente. */
EXECUTE INT_TEI_Paciente_CreateMedioContacto
  @idPaciente = 'ID_INTERNO_PACIENTE',
  @codigoSistema = 'email',
  @codigoUso = 'work',
  @valor = 'FbYhC@example.com',
  @ordenPreferencia = 1;
```
