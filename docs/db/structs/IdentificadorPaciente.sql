USE BD_ENTI_CORPORATIVA

DROP TABLE IF EXISTS [dbo].[PAC_PacienteExtendido_Identificador];

CREATE TABLE [dbo].[PAC_PacienteExtendido_Identificador]
(
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPacienteExtendido UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdPacienteExtendido) REFERENCES PAC_PacienteExtendido(Id),

    Uso VARCHAR(10) NULL CHECK (Uso IN ('usual', 'official', 'temp', 'secondary', 'old')),
    Valor VARCHAR(64) NOT NULL,
    CodigoPaisEmisorDocumento CHAR(3) NOT NULL,
    FOREIGN KEY (CodigoPaisEmisorDocumento) REFERENCES TAB_Pais_ISO3166_1N(Codigo),

    CodigoTipoIdentificador CHAR(2) NOT NULL,
    FOREIGN KEY (CodigoTipoIdentificador) REFERENCES TAB_TipoIdentificador(Codigo),
);