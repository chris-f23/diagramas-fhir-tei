/* https://hl7.org/fhir/R4/valueset-patient-contactrelationship.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_RelacionContactoPaciente];

CREATE TABLE [dbo].[ValueSet_RelacionContactoPaciente] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_RelacionContactoPaciente_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_RelacionContactoPaciente_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_RelacionContactoPaciente] (Codigo, Sistema, Texto) VALUES
  ('C', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Contacto de emergencia'),
  ('E', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Empleador'),
  ('F', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Agencia federal'),
  ('I', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Compañia de seguros'),
  ('N', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Pariente más cercano'),
  ('S', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Entidad estatal'),
  ('U', 'http://terminology.hl7.org/CodeSystem/v2-0131', 'Desconocido');