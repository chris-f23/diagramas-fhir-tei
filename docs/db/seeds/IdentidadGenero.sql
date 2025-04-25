-- https://hl7chile.cl/fhir/ig/clcore/1.9.2/ValueSet-VSIdentidaddeGenero.html
INSERT INTO [dbo].[ValueSet_IdentidadGenero] (Codigo, Sistema, Texto) VALUES
  ('1', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Masculino'),
  ('2', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Femenina'),
  ('3', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Transgénero Masculino'),
  ('4', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Transgénero Femenina'),
  ('5', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'No binarie'),
  ('6', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'Otra'),
  ('7', 'https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero', 'No Revelado')