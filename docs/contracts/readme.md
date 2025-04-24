# Procedimientos almacenados

## General

Un procedimiento almacenado solo puede recibir valores escalares como parámetros.

Un procedimiento almacenado solo puede tener 2 caminos:

- El procedimiento se ejecuta correctamente, por lo que el resultado será una tabla, donde la definición de columnas y la cantidad de filas devueltas dependerá del caso especifico.

- El procedimiento falla en algún punto, por lo que en lugar de devolver un resultado, lanza un error.
  - Todos los errores tendrán la propiedad `severity = 16`
  - La propiedad `state` del error servirá para identificar el tipo de error y así determinar como manejarlo. Los siguientes códigos están disponibles:
    - `state = 50`: Ocurrió un error interno. Pruebe reintentar la operación más tarde.
    - `state = 40`: Ocurrió un error al validar los parámetros. No es recomendable reintentar la operación con los mismos parámetros.
  - El contrato del procedimiento puede definir nuevos códigos de estado, de ser necesario manejar algún caso especial.

Si el requerimiento implica solo el llamado a uno o más procedimientos almacenados de obtención de información, no es necesario rodearlo con una transacción.

```ts
// Requerimiento: Obtener el identificador interno del paciente.

// ✅ OK pero no necesario
const tran = await db.beginTransaction();
const resultado1 = await tran.pacientes.getByIdentifier(/*...*/);
await tran.commit();

// ✅ OK
const resultado1 = await db.pacientes.getByIdentifier(/*...*/);
```

Si el requerimiento implica solo el llamado a dos o más procedimientos almacenados, donde al menos uno de estos procedimientos no es de obtención de información, es necesario contener los llamados con una transacción.

```ts
// Requerimiento: Agregar un domicilio a un paciente.

// ❌ Debe usarse una transacción
const resultado1 = await db.pacientes.getByIdentifier(/*...*/);
const resultado2 = await db.pacientes.createDomicilio(/*...*/);

// ❌ La transacción debe contener ambos llamados
const resultado1 = await db.pacientes.getByIdentifier(/*...*/);
const tran = await db.beginTransaction();
const resultado2 = await tran.pacientes.createDomicilio(/*...*/);
await tran.commit();

// ✅ OK
const tran = await db.beginTransaction();
const resultado1 = await tran.pacientes.getByIdentifier(/*...*/);
const resultado2 = await tran.pacientes.createDomicilio(/*...*/);
await tran.commit();
```

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

Si se busca recuperar una propiedad compleja del recurso, como una lista o un objeto, se debe definir un procedimiento almacenado adicional por cada propiedad no escalar del recurso que se quiera recuperar.

Para recuperar una propiedad compleja del recurso:

`INT_TEI_[NombreDelRecurso]_Get[NombrePropiedad]`

Si esta propiedad compleja es una lista, el resultado del procedimiento será una tabla con cero o más filas, donde cada fila representa un elemento de la lista. Dependiendo del caso, podrá o no haber una columna que represente el 'id' interno de cada elemento de la lista.

Si esta propiedad compleja es un objeto, el resultado del procedimiento sera una tabla con una sola fila, donde las columnas representan parte o la totalidad del objeto. Dependiendo del caso, podrá o no haber una columna que represente el 'id' interno del objeto.

### Procedimientos que crean recursos

Para crear un recurso:

`INT_TEI_[NombreDelRecurso]_Create`

El resultado del procedimiento debe ser una tabla con una única fila, la cuál debe contener parte del recurso creado. Una de las columnas de esta fila debe ser el 'id' interno del recurso, el cuál deberá usarse para cualquier otra operación sobre el recurso.

Ejemplos

- [`INT_TEI_Paciente_Create`](./paciente/create.md)

Dado que solo está permitido enviar valores escalares por parámetro, un solo procedimiento puede no bastar para cumplir con algun requerimiento de creación de recurso. En estos casos, se debe definir un procedimiento almacenado adicional por cada propiedad no escalar del recurso que se quiera crear.

Para agregar una propiedad compleja al recurso:

`INT_TEI_[NombreDelRecurso]_Create[NombrePropiedad]`

Si esta propiedad compleja es una lista, debe llamar al procedimiento almacenado correspondiente para cada elemento de la lista.

Ejemplos

- [`INT_TEI_Paciente_CreateDomicilio`](./paciente/create-domicilio.md)
