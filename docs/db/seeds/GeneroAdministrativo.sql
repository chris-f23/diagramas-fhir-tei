--https://hl7.org/fhir/R4/valueset-administrative-gender.html
INSERT INTO [dbo].[ValueSet_GeneroAdministrativo] (Codigo, Sistema, Texto) VALUES
  ('male', 'http://hl7.org/fhir/administrative-gender', 'Masculino'),
  ('female', 'http://hl7.org/fhir/administrative-gender', 'Femenino'),
  ('other', 'http://hl7.org/fhir/administrative-gender', 'Otro'),
  ('unknown', 'http://hl7.org/fhir/administrative-gender', 'Desconocido')
