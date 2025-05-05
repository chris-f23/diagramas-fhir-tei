USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_CodigoUnicoTerritorialRegion];
/*
  No: https://www.bcn.cl/leychile/navegar?idNorma=1123248&idParte=9950411
  Si: https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSCodigosRegionesCL.html
*/
CREATE TABLE [dbo].[TAB_CodigoUnicoTerritorialRegion]
(
  Codigo CHAR(2) PRIMARY KEY CHECK (Codigo LIKE '[0-9][0-9]'),
  Nombre VARCHAR(50) NOT NULL,
  Vigente BIT DEFAULT 1 NOT NULL,
  Orden INT NULL
);

INSERT INTO [dbo].[TAB_CodigoUnicoTerritorialRegion]
  (Codigo, Nombre, Orden)
VALUES
  ('15', 'Arica y Parinacota', 1),
  ('01', 'Tarapacá', 2),
  ('02', 'Antofagasta', 3),
  ('03', 'Atacama', 4),
  ('04', 'Coquimbo', 5),
  ('05', 'Valparaíso', 6),
  ('13', 'Metropolitana de Santiago', 7),
  ('06', 'Del Libertador Gral. Bernardo O''Higgins', 8),
  ('07', 'Del Maule', 9),
  ('08', 'Del Biobío', 10),
  ('09', 'De la Araucanía', 11),
  ('14', 'De los Ríos', 12),
  ('10', 'De los Lagos', 13),
  ('11', 'Aysén del Gral. Carlos Ibáñez del Campo', 14),
  ('12', 'Magallanes y de la Antártica Chilena', 15),
  ('16', 'Ñuble', 16);
