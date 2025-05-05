USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [TAB_GeneroAdministrativo]

CREATE TABLE [dbo].[TAB_GeneroAdministrativo]
(
    Codigo VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL
)

INSERT INTO [dbo].[TAB_GeneroAdministrativo]
  (Codigo, Nombre)
VALUES
  ('male', 'Masculino'),
  ('female', 'Femenino'),
  ('other', 'Otro'),
  ('unknown', 'Desconocido');