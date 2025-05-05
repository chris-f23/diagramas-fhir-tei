USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_CanalComunicacion];

CREATE TABLE [dbo].[PAC_PacienteExtendido_CanalComunicacion]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Sistema VARCHAR(10) NOT NULL CHECK (Sistema IN ('phone', 'email')),
  Uso VARCHAR(10) NOT NULL CHECK (Uso IN ('home', 'work', 'temp', 'old', 'mobile')),
  Valor VARCHAR(250) NOT NULL CHECK(LEN(TRIM(Valor)) > 3),
  OrdenPreferencia INT NOT NULL,
  FechaInicio DATETIME NULL,
  FechaTermino DATETIME NULL,

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);