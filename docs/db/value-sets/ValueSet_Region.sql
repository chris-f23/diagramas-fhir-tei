/* https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSCodigosRegionesCL.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_Region];

CREATE TABLE [dbo].[ValueSet_Region] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_Region_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_Region_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_Region] (Codigo, Sistema, Texto) VALUES
  ('15', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Arica y Parinacota'),
  ('01', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Tarapacá'),
  ('02', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Antofagasta'),
  ('03', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Atacama'),
  ('04', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Coquimbo'),
  ('05', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Valparaíso'),
  ('13', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Metropolitana de Santiago'),
  ('06', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Del Libertador Gral. Bernardo O"Higgins'),
  ('07', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Del Maule'),
  ('08', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Del Biobío'),
  ('09', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'De la Araucanía'),
  ('14', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'De los Ríos'),
  ('10', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'De los Lagos'),
  ('11', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Aysén del Gral. Carlos Ibáñez del Campo'),
  ('12', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Magallanes y de la Antártica Chilena'),
  ('16', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL', 'Ñuble');