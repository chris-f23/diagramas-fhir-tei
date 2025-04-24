## Buscar paciente dado uno de sus identificadores

Nombre procedimiento: `INT_TEI_Paciente_GetByIdentifier`

Descripción:

Obtiene el identificador interno del paciente que coincida con el [identificador de paciente de lista de espera](https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSTipoIdentificador.html) entregado por parámetro.

### Parámetros

- `valor VARCHAR(100)`: El valor del identificador. Requerido.
- `sistema VARCHAR(300)`: El sistema del tipo de identificador. Requerido.
- `codigo VARCHAR(20)`: El codigo del tipo de identificador. Requerido.

### Resultado

Si se encontró al paciente, el resultado será una tabla con solo una fila, la cuál tendrá una única columna con el identificador interno del paciente.

```sql
DECLARE @resultado TABLE (
  id INT
);
```

### Llamada de ejemplo

```sql
/* Obtiene a un paciente dado su identificador de tipo RUN. */
EXECUTE INT_TEI_Paciente_GetByIdentifier
  @valor = '1121557-2',
  @sistema = 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador',
  @codigo = '01';
```
