/* https://hl7.org/fhir/R4/valueset-administrative-gender.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_GeneroAdministrativo];

CREATE TABLE [dbo].[ValueSet_GeneroAdministrativo] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_GeneroAdministrativo_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_GeneroAdministrativo_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_GeneroAdministrativo] (Codigo, Sistema, Texto) VALUES
  ('male', 'http://hl7.org/fhir/administrative-gender', 'Masculino'),
  ('female', 'http://hl7.org/fhir/administrative-gender', 'Femenino'),
  ('other', 'http://hl7.org/fhir/administrative-gender', 'Otro'),
  ('unknown', 'http://hl7.org/fhir/administrative-gender', 'Desconocido');
