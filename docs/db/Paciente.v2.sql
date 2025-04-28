-- DROP TABLE IF EXISTS [dbo].[Paciente];

CREATE TABLE [dbo].[Paciente] (
  Id INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50) NULL, /* asdsa|asdasda */
  NombreSocial VARCHAR(50) NULL,
  ApellidoPaterno VARCHAR(50) NULL,
  ApellidoMaterno VARCHAR(50) NULL,

  IdIdentidadGenero INTEGER NOT NULL,
  SexoBiologico VARCHAR(10) NOT NULL CHECK (SexoBiologico IN ("male" | "female" | "other" | "unknown")),
  IdNacionalidad INTEGER NOT NULL,
  IdPaisOrigen INTEGER NOT NULL,
  IdReligion INTEGER NULL,
  PerteneceAPuebloOriginario BIT NOT NULL,
  PerteneceAPuebloAfrodescendiente BIT NULL,
  PueblosOriginarios INTEGER NULL
  Identifier!: IdentifierDto;
  Active?: boolean;
  Name?: NameDto;
  Telecom!: TelecomEntryDto[];
  FechaNac!: string;
  Fallecido!: boolean;
  Direccion?: DireccionDto[];
  EstadoCivil?: string;
  Contacto?: ContactoDto[];
  Lenguaje?: string[];
  GeneralPractitioner?: GeneralPractitionerDto[];
  Link?: LinkDto[];

);

CREATE TABLE [dbo].[IdentificadorPaciente] (
  Tipo VARCHAR(999) NOT NULL,
  Valor VARCHAR(999) NOT NULL
);

