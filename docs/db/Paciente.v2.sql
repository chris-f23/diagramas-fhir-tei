

CREATE TABLE [dbo].[PAC_PacienteExtendido]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  NumeroPaciente FLOAT NOT NULL,

  /* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/StructureDefinition-PatientLE-definitions.html#Patient.identifier */
  Identificadores VARCHAR(MAX),

  FOREIGN KEY (NumeroPaciente) REFERENCES PAC_Paciente(PAC_PAC_Numero),
);


CREATE TABLE [dbo].[PAC_PacienteExtendido_Domicilio]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Direccion VARCHAR(200) NOT NULL,
  Uso VARCHAR(10) NOT NULL CHECK (Uso IN ('home', 'work', 'temp', 'old', 'billing')),
  CodigoPais CHAR(3) NULL,
  CodigoUnicoTerritorialRegion CHAR(2) NULL,
  CodigoUnicoTerritorialProvincia CHAR(3) NULL,
  CodigoUnicoTerritorialComuna CHAR(5) NULL,
  FechaInicio DATETIME NULL,
  FechaTermino DATETIME NULL,

  Latitud FLOAT NULL,
  Longitud FLOAT NULL,
  EnSituacionDeCalle BIT NULL,

  FOREIGN KEY (CodigoPais) REFERENCES TAB_Pais_ISO3166_1N(Codigo),
  FOREIGN KEY (CodigoUnicoTerritorialRegion) REFERENCES TAB_RegionChile(CodigoUnicoTerritorial),
  FOREIGN KEY (CodigoUnicoTerritorialProvincia) REFERENCES TAB_ProvinciaChile(CodigoUnicoTerritorial),
  FOREIGN KEY (CodigoUnicoTerritorialComuna) REFERENCES TAB_ComunaChile(CodigoUnicoTerritorial),

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);

CREATE TABLE [dbo].[TAB_RelacionContactoPacienteExtendido]
(
  Codigo CHAR(2) PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL,
  Vigente BIT DEFAULT 1 NOT NULL
);

CREATE TABLE [dbo].[PAC_PacienteExtendido_Contacto]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Nombre VARCHAR(50) NULL,
  ApellidoPaterno VARCHAR(50) NULL,
  ApellidoMaterno VARCHAR(50) NULL,

  /* https://hl7chile.cl/fhir/ig/clcore/1.9.2/StructureDefinition-IdContacto.html */
  Identificadores VARCHAR(MAX) NULL,

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);

CREATE TABLE [dbo].[PAC_PacienteExtendido_Contacto_Relacion]
(
  IdContacto UNIQUEIDENTIFIER NOT NULL,
  CodigoRelacion CHAR(2) NOT NULL,

  FOREIGN KEY (IdContacto) REFERENCES PAC_Paciente_Contacto(Id),
  FOREIGN KEY (CodigoRelacion) REFERENCES TAB_RelacionContactoPacienteExtendido(Id),
);


CREATE TABLE [dbo].[TAB_Lenguaje]
(
  Codigo CHAR(5) PRIMARY KEY CHECK (Codigo LIKE '[a-z][a-z]-[A-Z][A-Z]'),
  Nombre VARCHAR(100) NOT NULL,
  Vigente BIT DEFAULT 1 NOT NULL
);

CREATE TABLE [dbo].[PAC_PacienteExtendido_Contacto_Lenguaje]
(
  IdContacto UNIQUEIDENTIFIER NOT NULL,
  CodigoLenguaje CHAR(5) NOT NULL,

  FOREIGN KEY (IdContacto) REFERENCES PAC_Paciente_Contacto(Id),
  FOREIGN KEY (CodigoLenguaje) REFERENCES TAB_Lenguaje(Codigo),
);



CREATE TABLE [dbo].[PAC_PacienteExtendido_CanalComunicacion]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Sistema VARCHAR(10) NOT NULL CHECK (Sistema IN ('phone', 'email')),
  Uso VARCHAR(10) NOT NULL CHECK (Uso IN ('home', 'work', 'temp', 'old', 'mobile')),
  Valor VARCHAR(250) NOT NULL CHECK(
    LEN(TRIM(Valor)) > 3 AND
      (Sistema = 'email' AND Valor LIKE '%@%')),
  OrdenPreferencia INT NOT NULL,
  FechaInicio DATETIME NULL,
  FechaTermino DATETIME NULL,

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);

CREATE TABLE [dbo].[PAC_PacienteExtendido_MismoPaciente]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,
  IdPacienteExtendidoRelacionado UNIQUEIDENTIFIER NOT NULL CHECK(IdPacienteExtendidoRelacionado <> IdPacienteExtendido),
  Tipo VARCHAR(10) NOT NULL CHECK (Tipo IN ('replaced-by', 'replaces', 'refer', 'seealso')),

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
  FOREIGN KEY (IdPacienteExtendidoRelacionado) REFERENCES PAC_PacienteExtendido(Id),
);

