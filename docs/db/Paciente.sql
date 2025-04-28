USE [BD_FHIR_TIEMPOS_ESPERA_INTEROPERABLES]

BEGIN TRANSACTION TRAN_PACIENTE
BEGIN TRY
  DROP TABLE IF EXISTS [dbo].[IdentificadorContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[RelacionContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[ContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[MedioContactoPaciente];
  DROP TABLE IF EXISTS [dbo].[DomicilioPaciente];
  DROP TABLE IF EXISTS [dbo].[IdentificadorPaciente];
  DROP TABLE IF EXISTS [dbo].[LenguajePaciente];
  DROP TABLE IF EXISTS [dbo].[Paciente];

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
    IdIdentidadGenero INTEGER NOT NULL,
    IdSexoAdministrativo INTEGER NOT NULL,
    IdSexoBiologico INTEGER NULL,
    IdNacionalidad INTEGER NOT NULL,
    IdPaisOrigen INTEGER NOT NULL,
    IdReligion INTEGER NULL,
    IdPuebloOriginario INTEGER NULL,
    IdEstadoCivil INTEGER NULL
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
    IdLenguaje INTEGER NOT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdLenguaje) REFERENCES ValueSet_Lenguaje(Id),
  );

  CREATE TABLE [dbo].[IdentificadorPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    IdTipoIdentificador INTEGER NOT NULL,
    Uso VARCHAR(10) CHECK (Uso IN ('usual', 'official', 'temp', 'secondary', 'old')) NOT NULL,
    Valor VARCHAR(255) NOT NULL,
    IdPaisEmisorDocumento INTEGER NOT NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdPaisEmisorDocumento) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdTipoIdentificador) REFERENCES ValueSet_TipoIdentificador(Id)
  );

  CREATE TABLE [dbo].[DomicilioPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Direccion VARCHAR(255) NOT NULL,
    Uso VARCHAR(10) CHECK (Uso IN ('home', 'work', 'temp', 'old', 'billing')),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    IdPais INTEGER NULL,
    IdRegion INTEGER NULL,
    IdProvincia INTEGER NULL,
    IdComuna INTEGER NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(Id),
    FOREIGN KEY (IdPais) REFERENCES ValueSet_Pais(Id),
    FOREIGN KEY (IdRegion) REFERENCES ValueSet_Region(Id),
    FOREIGN KEY (IdProvincia) REFERENCES ValueSet_Provincia(Id),
    FOREIGN KEY (IdComuna) REFERENCES ValueSet_Comuna(Id)
  );

  CREATE TABLE [dbo].[MedioContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdPaciente UNIQUEIDENTIFIER NOT NULL,
    Sistema VARCHAR(10) CHECK (Sistema IN ('phone', 'email')) NOT NULL,
    Uso VARCHAR(10) CHECK (Uso IN ('home', 'work', 'temp', 'old', 'mobile')) NULL,
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
    IdContactoPaciente UNIQUEIDENTIFIER NOT NULL,
    IdRelacionContacto INTEGER NOT NULL,
    FOREIGN KEY (IdContactoPaciente) REFERENCES ContactoPaciente(Id),
    FOREIGN KEY (IdRelacionContacto) REFERENCES ValueSet_RelacionContactoPaciente(Id)
  );

  CREATE TABLE [dbo].[IdentificadorContactoPaciente] (
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdContactoPaciente UNIQUEIDENTIFIER NOT NULL,
    Sistema VARCHAR(250) NOT NULL CHECK (Sistema LIKE 'http%'),
    Valor VARCHAR(255) NOT NULL,
    IdPaisEmisorDocumento INTEGER NOT NULL,
    CodingType VARCHAR(MAX) NULL, /* JSON */
    FOREIGN KEY (IdContactoPaciente) REFERENCES ContactoPaciente(Id),
    FOREIGN KEY (IdPaisEmisorDocumento) REFERENCES ValueSet_Pais(Id),
  );
  COMMIT TRANSACTION TRAN_PACIENTE
END TRY
BEGIN CATCH
  THROW
END CATCH