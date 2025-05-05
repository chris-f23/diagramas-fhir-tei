USE [BD_ENTI_CORPORATIVA]

DROP TABLE IF EXISTS [dbo].[TAB_Religion];

CREATE TABLE [dbo].[TAB_Religion]
(
    Codigo VARCHAR(2) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
)

/* https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-VSReligion.html */
INSERT INTO [dbo].[TAB_Religion]
    (Codigo, Nombre)
VALUES
    ('1', 'Católica'),
    ('2', 'Evangélica'),
    ('3', 'Testigo de Jehová'),
    ('4', 'Judaica'),
    ('5', 'Mormón'),
    ('6', 'Musulmana'),
    ('7', 'Ortodoxa'),
    ('8', 'Otra religión o credo'),
    ('9', 'Ninguna, ateo, agnóstico'),
    ('99', 'Desconocido');