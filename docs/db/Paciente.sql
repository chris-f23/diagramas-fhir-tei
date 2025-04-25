
USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

BEGIN TRANSACTION TRAN_PACIENTE
BEGIN TRY
  DROP TABLE IF EXISTS [dbo].[TipoIdentificadorContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[IdentificadorContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[RelacionContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[ContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[MedioContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[DomicilioPaciente];
  DROP TABLE IF EXISTS [dbo].[IdentificadorPaciente];
  DROP TABLE IF EXISTS [dbo].[LenguajePaciente];
  DROP TABLE IF EXISTS [dbo].[Paciente];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Lenguaje];
  DROP TABLE IF EXISTS [dbo].[ValueSet_RelacionContacto];
  DROP TABLE IF EXISTS [dbo].[ValueSet_EstadoCivil];
  DROP TABLE IF EXISTS [dbo].[ValueSet_PuebloOriginario];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Religion];
  DROP TABLE IF EXISTS [dbo].[ValueSet_GeneroAdministrativo];
  DROP TABLE IF EXISTS [dbo].[ValueSet_IdentidadGenero];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Comuna];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Provincia];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Region];
  DROP TABLE IF EXISTS [dbo].[ValueSet_Pais];
  DROP TABLE IF EXISTS [dbo].[ValueSetExtensible_TipoIdentificadorContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[ValueSet_TipoIdentificador]

  CREATE TABLE [dbo].[ValueSet_TipoIdentificador] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_TipoIdentificador_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_TipoIdentificador_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSetExtensible_TipoIdentificadorContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSetExtensible_TipoIdentificadorContactoPaciente_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSetExtensible_TipoIdentificadorContactoPaciente_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_Pais] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Pais_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Pais_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_Region] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Region_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Region_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_Provincia] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Provincia_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Provincia_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_Comuna] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Comuna_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Comuna_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_IdentidadGenero] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_IdentidadGenero_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_IdentidadGenero_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_GeneroAdministrativo] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_GeneroAdministrativo_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_GeneroAdministrativo_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_Religion] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Religion_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Religion_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_PuebloOriginario] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_PuebloOriginario_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_PuebloOriginario_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_EstadoCivil] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_EstadoCivil_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_EstadoCivil_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  CREATE TABLE [dbo].[ValueSet_RelacionContacto] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_RelacionContacto_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_RelacionContacto_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  /** https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSCodigoslenguaje.html */
  CREATE TABLE [dbo].[ValueSet_Lenguaje] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Codigo VARCHAR(100) NOT NULL,
    Sistema VARCHAR(250) NOT NULL,
    Texto VARCHAR(250) NOT NULL,
    CONSTRAINT UQ_ValueSet_Lenguaje_Codigo_Sistema UNIQUE (Codigo, Sistema),
    CONSTRAINT CK_ValueSet_Lenguaje_SistemaUrl CHECK (Sistema LIKE 'http%')
  );

  /** --------------------------------------------------------------------------------------- */

  CREATE TABLE [dbo].[Paciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    PerteneceAPuebloOriginario BIT NOT NULL,
    PerteneceAPuebloAfrodescendiente BIT NULL,
    NombreOficial VARCHAR(50) NULL, /**Cada nombre está delimitado por el carácter "|" */
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    NombreSocial VARCHAR(50) NULL, /**Cada nombre está delimitado por el carácter "|" */
    FechaNacimiento DATETIME NOT NULL,
    FechaFallecimiento DATETIME NULL,
    IdIdentidadGenero UNIQUEIDENTIFIER NOT NULL,
    IdSexoAdministrativo UNIQUEIDENTIFIER NOT NULL,
    IdSexoBiologico UNIQUEIDENTIFIER NULL,
    IdNacionalidad UNIQUEIDENTIFIER NOT NULL,
    IdPaisOrigen UNIQUEIDENTIFIER NOT NULL,
    IdReligion UNIQUEIDENTIFIER NULL,
    IdPuebloOriginario UNIQUEIDENTIFIER NULL,
    IdEstadoCivil UNIQUEIDENTIFIER NULL
    FOREIGN KEY (IdIdentidadGenero) REFERENCES ValueSet_IdentidadGenero(Id),
    FOREIGN KEY (IdSexoAdministrativo) REFERENCES ValueSet_GeneroAdministrativo(Id),
    FOREIGN KEY (IdSexoBiologico) REFERENCES ValueSet_GeneroAdministrativo(Id),
    FOREIGN KEY (IdNacionalidad) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdPaisOrigen) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdReligion) REFERENCES ValueSet_Religion(Id),
    FOREIGN KEY (IdPuebloOriginario) REFERENCES ValueSet_PuebloOriginario(Id),
    FOREIGN KEY (IdEstadoCivil) REFERENCES ValueSet_EstadoCivil(Id)

    /** Pendientes:
    - generalPractitioner
    - nombre oficial y nombre social deben ser una lista en vez de un valor unico
    */
  );

  CREATE TABLE [dbo].[LenguajePaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    IdLenguaje UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdLenguaje) REFERENCES ValueSet_Lenguaje(Id),
  );

  CREATE TABLE [dbo].[IdentificadorPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    IdTipoIdentificador UNIQUEIDENTIFIER NOT NULL,
    CodigoUso VARCHAR(10) CHECK (CodigoUso IN ('usual', 'official', 'temp', 'secondary', 'old')) NOT NULL,
    Valor VARCHAR(255) NOT NULL,
    IdPaisEmisorDocumento UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdPaisEmisorDocumento) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdTipoIdentificador) REFERENCES ValueSet_TipoIdentificador(Id)
  );

  CREATE TABLE [dbo].[DomicilioPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Direccion VARCHAR(255) NOT NULL,
    CodigoUso VARCHAR(10) CHECK (CodigoUso IN ('home', 'work', 'temp', 'old', 'billing')),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    IdPais UNIQUEIDENTIFIER NULL,
    IdRegion UNIQUEIDENTIFIER NULL,
    IdProvincia UNIQUEIDENTIFIER NULL,
    IdComuna UNIQUEIDENTIFIER NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdPais) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdRegion) REFERENCES ValueSet_Region(Id),
    FOREIGN KEY (IdProvincia) REFERENCES ValueSet_Provincia(Id),
    FOREIGN KEY (IdComuna) REFERENCES ValueSet_Comuna(Id)
  );

  CREATE TABLE [dbo].[MedioContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    CodigoSistema VARCHAR(10) CHECK (CodigoSistema IN ('phone', 'email')) NOT NULL,
    CodigoUso VARCHAR(10) CHECK (CodigoUso IN ('home', 'work', 'temp', 'old', 'mobile')) NULL,
    Valor VARCHAR(255) NOT NULL,
    OrdenPreferencia INT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id)
  );

  CREATE TABLE [dbo].[ContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    NombreOficial VARCHAR(50) NULL, /**Cada nombre está delimitado por el carácter "|" */
    ApellidoPaterno VARCHAR(255) NULL,
    ApellidoMaterno VARCHAR(255) NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id)
  );

  CREATE TABLE [dbo].[RelacionContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdContacto UNIQUEIDENTIFIER NOT NULL,
    IdRelacion UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdContacto) REFERENCES ContactoPaciente(Id),
    FOREIGN KEY (IdRelacion) REFERENCES ValueSet_RelacionContacto(Id)
  );

  CREATE TABLE [dbo].[IdentificadorContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    CodigoSistema VARCHAR(250) NOT NULL CHECK (CodigoSistema LIKE 'http%'),
    Valor VARCHAR(255) NOT NULL,
    IdPaisEmisorDocumento UNIQUEIDENTIFIER NOT NULL,
    --IdTipoIdentificadorContactoPaciente UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdPaisEmisorDocumento) REFERENCES ValueSet_Pais(Id),
    --FOREIGN KEY (IdTipoIdentificadorContactoPaciente) REFERENCES TipoIdentificadorContactoPaciente(Id)
  );

  CREATE TABLE [dbo].[TipoIdentificadorContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdIdentificadorContacto UNIQUEIDENTIFIER NOT NULL,
    IdTipoIdentificadorContactoPaciente UNIQUEIDENTIFIER NOT NULL,
    FOREIGN KEY (IdIdentificadorContacto) REFERENCES IdentificadorContactoPaciente(Id),
    FOREIGN KEY (IdTipoIdentificadorContactoPaciente) REFERENCES ValueSetExtensible_TipoIdentificadorContactoPaciente(Id)
  )
  COMMIT TRANSACTION TRAN_PACIENTE
END TRY
BEGIN CATCH
  THROW
END CATCH
