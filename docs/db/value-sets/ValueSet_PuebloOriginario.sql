/* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-PueblosOriginariosVS.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_PuebloOriginario];

CREATE TABLE [dbo].[ValueSet_PuebloOriginario] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_PuebloOriginario_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_PuebloOriginario_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_PuebloOriginario] (Codigo, Sistema, Texto) VALUES
  ('01', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Mapuche'),
  ('02', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Aymara'),
  ('03', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Rapa Nui O Pascuense'),
  ('04', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Lickanantay'),
  ('05', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Quechua'),
  ('06', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Colla'),
  ('07', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Diaguita'),
  ('08', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Kawésqar'),
  ('09', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Yagán'),
  ('11', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Chango'),
  ('10', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/PueblosOriginariosCS', 'Otro (Especificar)');