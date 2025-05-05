USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_PuebloOriginarioChile]

CREATE TABLE [dbo].[TAB_PuebloOriginarioChile]
(
  Codigo CHAR(2) PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL
)

/* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-PueblosOriginariosVS.html */
INSERT INTO [dbo].[TAB_PuebloOriginarioChile]
  (Codigo, Nombre)
VALUES
  ('01', 'Mapuche'),
  ('02', 'Aymara'),
  ('03', 'Rapa Nui O Pascuense'),
  ('04', 'Lickanantay'),
  ('05', 'Quechua'),
  ('06', 'Colla'),
  ('07', 'Diaguita'),
  ('08', 'Kawésqar'),
  ('09', 'Yagán'),
  ('11', 'Chango'),
  ('10', 'Otro (Especificar)');