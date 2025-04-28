/* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-VSEstadoCivil.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_EstadoCivil];

CREATE TABLE [dbo].[ValueSet_EstadoCivil] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_EstadoCivil_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_EstadoCivil_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_EstadoCivil] (Codigo, Sistema, Texto) VALUES
  ('01', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Soltero(a)'),
  ('02', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Casado(a)'),
  ('03', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Viudo(a)'),
  ('04', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Divorciado(a)'),
  ('05', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Separado(a) judicialmente'),
  ('06', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Conviviente civíl'),
  ('99', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstadoCivil', 'Desconocido');