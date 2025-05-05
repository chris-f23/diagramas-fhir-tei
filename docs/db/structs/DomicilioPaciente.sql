USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Domicilio];

CREATE TABLE [dbo].[PAC_PacienteExtendido_Domicilio]
(
  Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
  IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,

  Direccion VARCHAR(200) NOT NULL,
  Uso VARCHAR(10) NOT NULL CHECK (Uso IN ('home', 'work', 'temp', 'old', 'billing')),
  
  CodigoPais CHAR(3) NULL,
  CodigoRegion CHAR(2) NULL,
  CodigoProvincia CHAR(3) NULL,
  CodigoComuna CHAR(5) NULL,

  FechaInicio DATETIME NULL,
  FechaTermino DATETIME NULL,

  Latitud FLOAT NULL,
  Longitud FLOAT NULL,
  EnSituacionDeCalle BIT NULL,

  FOREIGN KEY (CodigoPais) REFERENCES TAB_Pais_ISO3166_1N(Codigo),
  FOREIGN KEY (CodigoRegion) REFERENCES TAB_CodigoUnicoTerritorialRegion(Codigo),
  FOREIGN KEY (CodigoProvincia) REFERENCES TAB_CodigoUnicoTerritorialProvincia(Codigo),
  FOREIGN KEY (CodigoComuna) REFERENCES TAB_CodigoUnicoTerritorialComuna(Codigo),

  FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),
);