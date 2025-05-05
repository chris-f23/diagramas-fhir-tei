USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_IdentidadGenero]

CREATE TABLE [dbo].[TAB_IdentidadGenero]
(
  Codigo CHAR(2) PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL
)

/* https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSIdentidaddeGenero.html */
INSERT INTO [dbo].[TAB_IdentidadGenero]
  (Codigo, Nombre)
VALUES
  ('1', 'Masculino'),
  ('2', 'Femenina'),
  ('3', 'Masculino'),
  ('4', 'Femenina'),
  ('5', 'binarie'),
  ('6', 'Otra'),
  ('7', 'Revelado');