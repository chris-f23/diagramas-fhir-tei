/* https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSIdentidaddeGenero.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_IdentidadGenero];

CREATE TABLE [dbo].[ValueSet_IdentidadGenero] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_IdentidadGenero_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_IdentidadGenero_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_IdentidadGenero] (Codigo, Sistema, Texto) VALUES
  ('1', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Masculino'),
  ('2', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Femenina'),
  ('3', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Transgénero Masculino'),
  ('4', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Transgénero Femenina'),
  ('5', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'No binarie'),
  ('6', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Otra'),
  ('7', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'No Revelado');