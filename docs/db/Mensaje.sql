USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]
GO

DROP TABLE IF EXISTS [dbo].[MensajeTiempoEsperaInteroperable]

CREATE TABLE [dbo].[MensajeTiempoEsperaInteroperable]
(
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT(NEWID()),
    TipoEvento VARCHAR(20) NOT NULL CHECK(TipoEvento IN ('INICIAR', 'REFERENCIAR', 'REVISAR', 'PRIORIZAR', 'AGENDAR', 'ATENDER', 'TERMINAR')),
    EstadoNotificacionMINSAL VARCHAR(25) NOT NULL CHECK (EstadoEnvioMINSAL IN ('PENDIENTE', 'ENVIADO', 'ERROR_ENVIO', 'ERROR_REINTENTO_SUPERADO')) DEFAULT('PENDIENTE'),
    EstadoNotificacionSistemaOrigen VARCHAR(25) NOT NULL CHECK (EstadoEnvioEstablecimientoOrigen IN ('NO_APLICA', 'PENDIENTE', 'ENVIADO', 'ERROR_ENVIO', 'ERROR_REINTENTO_SUPERADO')),
    ReintentosMINSAL INTEGER NOT NULL DEFAULT(0),
    ReintentosSistemaOrigen INTEGER NOT NULL DEFAULT(0),
    FechaEnvio DATETIME NULL,
    RespuestaMINSAL VARCHAR(MAX) NULL,
    RespuestaSistemaOrigen VARCHAR(MAX) NULL,
    MensajeDTO VARCHAR(MAX) NOT NULL,
);



INSERT INTO MensajeTiempoEsperaInteroperable
    (TipoEvento, MensajeDTO, DebeNotificarSistemaOrigen)
VALUES
    ('INICIAR', '{ id: "123" }', 1);


SELECT *
FROM MensajeTiempoEsperaInteroperable

