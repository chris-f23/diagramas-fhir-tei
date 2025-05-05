USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_RelacionContactoPacienteExtendido];

CREATE TABLE [dbo].[TAB_RelacionContactoPacienteExtendido]
(
  Codigo CHAR(1) PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL,
  Vigente BIT DEFAULT 1 NOT NULL
);

INSERT INTO [dbo].[TAB_RelacionContactoPacienteExtendido]
  (Codigo, Nombre)
VALUES
  ('C', 'Contacto de emergencia'),
  ('E', 'Empleador'),
  ('F', 'Entidad federal'),
  ('I', 'Compañia de seguros'),
  ('N', 'Pariente más cercano'),
  ('S', 'Entidad estatal'),
  ('U', 'Desconocido');
