USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Identificador];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Contacto_Relacion];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Contacto];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_CanalComunicacion];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Domicilio];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Lenguaje];

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido];

CREATE TABLE [dbo].[PAC_PacienteExtendido]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),

  NumeroPaciente FLOAT NOT NULL,
  FOREIGN KEY (NumeroPaciente) REFERENCES PAC_Paciente(PAC_PAC_Numero),

  EstaActivo BIT NOT NULL DEFAULT(1),

  NombreSocial VARCHAR(50) NULL,
  NombreOficial VARCHAR(50) NULL,
  ApellidoPaterno VARCHAR(50) NULL,
  ApellidoMaterno VARCHAR(50) NULL,

  /* https://hl7.org/fhir/R4/valueset-administrative-gender.html */
  CodigoGeneroAdministrativo VARCHAR(10) NOT NULL,
  FOREIGN KEY (CodigoGeneroAdministrativo) REFERENCES TAB_GeneroAdministrativo(Codigo),

  FechaNacimiento DATETIME NOT NULL,
  FechaFallecimiento DATETIME NULL DEFAULT NULL,

  CodigoEstadoCivil CHAR(2) NULL,
  FOREIGN KEY (CodigoEstadoCivil) REFERENCES TAB_EstadoCivil(Codigo),

  /* Extensiones */
  CodigoIdentidadGenero CHAR(2) NOT NULL,
  FOREIGN KEY (CodigoIdentidadGenero) REFERENCES TAB_IdentidadGenero(Codigo),

  CodigoSexoBiologico VARCHAR(10) NULL,
  FOREIGN KEY (CodigoSexoBiologico) REFERENCES TAB_GeneroAdministrativo(Codigo),

  CodigoNacionalidad CHAR(3) NOT NULL,
  FOREIGN KEY (CodigoNacionalidad) REFERENCES TAB_Pais_ISO3166_1N(Codigo),

  CodigoPaisOrigen CHAR(3) NOT NULL,
  FOREIGN KEY (CodigoPaisOrigen) REFERENCES TAB_Pais_ISO3166_1N(Codigo),

  CodigoReligion VARCHAR(2) NULL,
  FOREIGN KEY (CodigoReligion) REFERENCES TAB_Religion(Codigo),

  PerteneceAPuebloOriginarioChile BIT NOT NULL,
  PerteneceAPuebloAfrodescendiente BIT NULL,

  CodigoPuebloOriginarioChile CHAR(2) NULL,
  FOREIGN KEY (CodigoPuebloOriginarioChile) REFERENCES TAB_PuebloOriginarioChile(Codigo),

  /* Propiedades complejas */

  /*
    https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/StructureDefinition-PatientLE-definitions.html#key_Patient.id
    Identificador asignado por MINSAL
  */
  _Id VARCHAR(64) NULL,

  _Link VARCHAR(MAX) NULL,
  _GeneralPractitioner VARCHAR(MAX) NULL,

);
