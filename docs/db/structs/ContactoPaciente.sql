USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Contacto_Relacion];
DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Contacto];

CREATE TABLE [dbo].[PAC_PacienteExtendido_Contacto]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Nombre VARCHAR(50) NULL,
  ApellidoPaterno VARCHAR(50) NULL,
  ApellidoMaterno VARCHAR(50) NULL,

  /* https://hl7chile.cl/fhir/ig/clcore/1.9.2/StructureDefinition-IdContacto.html */
  _Identifier VARCHAR(MAX) NULL,

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);

CREATE TABLE [dbo].[PAC_PacienteExtendido_Contacto_Relacion]
(
  IdContacto UNIQUEIDENTIFIER NOT NULL,
  CodigoRelacion CHAR(1) NOT NULL,

  FOREIGN KEY (IdContacto) REFERENCES PAC_PacienteExtendido_Contacto(Id),
  FOREIGN KEY (CodigoRelacion) REFERENCES TAB_RelacionContactoPacienteExtendido(Codigo),
);

