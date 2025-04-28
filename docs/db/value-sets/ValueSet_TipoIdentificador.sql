/* https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSTipoIdentificador.html */

USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

DROP TABLE IF EXISTS [dbo].[ValueSet_TipoIdentificador];

CREATE TABLE [dbo].[ValueSet_TipoIdentificador] (
  Id INTEGER IDENTITY(1,1) PRIMARY KEY,
  Codigo VARCHAR(100) NOT NULL,
  Sistema VARCHAR(250) NOT NULL,
  Texto VARCHAR(250) NOT NULL,
  CONSTRAINT UQ_ValueSet_TipoIdentificador_Codigo_Sistema UNIQUE (Codigo, Sistema),
  CONSTRAINT CK_ValueSet_TipoIdentificador_SistemaUrl CHECK (Sistema LIKE 'http%')
);

INSERT INTO [dbo].[ValueSet_TipoIdentificador] (Codigo, Sistema, Texto) VALUES
  ('01', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'RUN'),
  ('02', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'RUN Provisorio'),
  ('03', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'RUN Madre'),
  ('04', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'Número Folio'),
  ('05', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'PPN'),
  ('06', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'Documento de identificación del país de origen'),
  ('07', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'Acta de nacimiento del país de origen'),
  ('08', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'NIP'),
  ('09', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'NIC'),
  ('10', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'IPA'),
  ('11', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'IPE'),
  ('12', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'Número de Ficha Clínica Sistema Local'),
  ('13', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'RNPI'),
  ('14', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador', 'OTRO');