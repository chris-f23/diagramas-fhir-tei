USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Lenguaje];

CREATE TABLE [dbo].[PAC_PacienteExtendido_Lenguaje]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,
  CodigoLenguaje CHAR(5) NOT NULL,

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
  FOREIGN KEY (CodigoLenguaje) REFERENCES TAB_Lenguaje(Codigo),
);

