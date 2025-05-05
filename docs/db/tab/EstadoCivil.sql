USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_EstadoCivil];

CREATE TABLE [dbo].[TAB_EstadoCivil]
(
  Codigo CHAR(2) PRIMARY KEY CHECK (Codigo LIKE '[0-9][0-9]'),
  Nombre VARCHAR(50) NOT NULL
)

/* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-VSEstadoCivil.html */
INSERT INTO [dbo].[TAB_EstadoCivil]
  (Codigo, Nombre)
VALUES
  ('01', 'Soltero(a)'),
  ('02', 'Casado(a)'),
  ('03', 'Viudo(a)'),
  ('04', 'Divorciado(a)'),
  ('05', 'Separado(a) judicialmente'),
  ('06', 'Conviviente civil'),
  ('99', 'Desconocido	Desconocido');