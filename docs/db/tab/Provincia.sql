USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [TAB_CodigoUnicoTerritorialProvincia];
/*
  https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSCodigosProvinciasCL.html
*/
CREATE TABLE [dbo].[TAB_CodigoUnicoTerritorialProvincia]
(
  Codigo CHAR(3) PRIMARY KEY CHECK (Codigo LIKE '[0-9][0-9][0-9]'),
  Nombre VARCHAR(50) NOT NULL,
  Vigente BIT DEFAULT 1 NOT NULL,
  CodigoRegion CHAR(2) NOT NULL,

  FOREIGN KEY (CodigoRegion) REFERENCES TAB_CodigoUnicoTerritorialRegion(Codigo)
);

INSERT INTO [dbo].[TAB_CodigoUnicoTerritorialProvincia]
  (CodigoRegion, Codigo, Nombre)
VALUES
  ('15', '151', 'Arica'),
  ('15', '152', 'Parinacota'),
  ('01', '011', 'Iquique'),
  ('01', '014', 'Tamarugal'),
  ('02', '021', 'Antofagasta'),
  ('02', '022', 'El Loa'),
  ('02', '023', 'Tocopilla'),
  ('03', '031', 'Copiapó'),
  ('03', '032', 'Chañaral'),
  ('03', '033', 'Huasco'),
  ('04', '041', 'Elqui'),
  ('04', '042', 'Choapa'),
  ('04', '043', 'Limarí'),
  ('05', '051', 'Valparaíso'),
  ('05', '052', 'Isla de Pascua'),
  ('05', '053', 'Los Andes'),
  ('05', '054', 'Petorca'),
  ('05', '055', 'Quillota'),
  ('05', '056', 'San Antonio'),
  ('05', '057', 'San Felipe de Aconcagua'),
  ('05', '058', 'Marga Marga'),
  ('13', '131', 'Santiago'),
  ('13', '132', 'Cordillera'),
  ('13', '133', 'Chacabuco'),
  ('13', '134', 'Maipo'),
  ('13', '135', 'Melipilla'),
  ('13', '136', 'Talagante'),
  ('06', '061', 'Cachapoal'),
  ('06', '062', 'Cardenal Caro'),
  ('06', '063', 'Colchagua'),
  ('07', '071', 'Talca'),
  ('07', '072', 'Cauquenes'),
  ('07', '073', 'Curicó'),
  ('07', '074', 'Linares'),
  ('08', '081', 'Concepción'),
  ('08', '082', 'Arauco'),
  ('08', '083', 'Biobío'),
  ('09', '091', 'Cautín'),
  ('09', '092', 'Malleco'),
  ('14', '141', 'Valdivia'),
  ('14', '142', 'Ranco'),
  ('10', '101', 'Llanquihue'),
  ('10', '102', 'Chiloé'),
  ('10', '103', 'Osorno'),
  ('10', '104', 'Palena'),
  ('11', '111', 'Coihaique'),
  ('11', '112', 'Aysén'),
  ('11', '113', 'Capitán Prat'),
  ('11', '114', 'General Carrera'),
  ('12', '121', 'Magallanes'),
  ('12', '122', 'Antártica Chilena'),
  ('12', '123', 'Tierra del Fuego'),
  ('12', '124', 'última Esperanza'),
  ('16', '161', 'Diguillín'),
  ('16', '162', 'Itata'),
  ('16', '163', 'Punilla');
