# Procedimientos almacenados

## General

Un procedimiento almacenado solo puede tener 2 caminos:

- El procedimiento se ejecuta correctamente, por lo que el resultado será una tabla, donde la definición de columnas y la cantidad de filas devueltas dependerá del caso especifico.

- El procedimiento falla en algún punto, por lo que en lugar de devolver un resultado, lanza un error.
  - Todos los errores tendrán la propiedad `severity = 16`
  - La propiedad `state` del error servirá para identificar el tipo de error y así determinar como manejarlo. Los siguientes códigos están disponibles:
    - `state = 50`: Ocurrió un error interno. Pruebe reintentar la operación más tarde.
    - `state = 40`: Ocurrió un error al validar los parámetros. No es recomendable reintentar la operación con los mismos parámetros.
  - El contrato del procedimiento puede definir nuevos códigos de estado, de ser necesario manejar algún caso especial.

## Tipos de procedimientos

Un procedimiento almacenado debe tener un único objetivo bien definido. El objetivo debe ser claramente identificado en el nombre del procedimiento, el cuál debe seguir las siguientes reglas.

### Procedimientos que obtienen información

Para encontrar un recurso dado uno de sus [identificadores de FHIR](https://hl7.org/fhir/R4/datatypes.html#identifier):

`INT_TEI_[NombreDelRecurso]_GetByIdentifier`

Los parámetros de este procedimiento deben ser

- `valor VARCHAR(???)`: El valor del identificador. Requerido.
- `sistema VARCHAR(???)`: El sistema del tipo de identificador. Requerido.
- `codigo VARCHAR(???)`: El codigo del tipo de identificador. Requerido.

El resultado del procedimiento debe ser una tabla con una única fila la cuál debe contener parte del recurso identificado. Una de las columnas de esta fila debe ser el 'id' interno del recurso, el cuál deberá usarse para cualquier otra operación sobre el recurso.

Ejemplos

- [`INT_TEI_Paciente_GetByIdentifier`](./paciente/get-by-identifier.md)

### Procedimientos que crean recursos

Para crear un recurso:

`INT_TEI_[NombreDelRecurso]_Create`

El resultado del procedimiento debe ser una tabla con una única fila, la cuál debe contener parte del recurso creado. Una de las columnas de esta fila debe ser el 'id' interno del recurso, el cuál deberá usarse para cualquier otra operación sobre el recurso.

Ejemplos

- [`INT_TEI_Paciente_Create`](./paciente/create.md)
