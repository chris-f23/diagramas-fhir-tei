-- https://build.fhir.org/ig/Minsal-CL/SIGTEv2-IG/ValueSet-VSReligion.html
INSERT INTO [dbo].[ValueSet_Religion] (Codigo, Sistema, Texto) VALUES
  ('1', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Católica'),
  ('2', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Evangélica'),
  ('3', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Testigo de Jehová'),
  ('4', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Judaica'),
  ('5', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Mormón'),
  ('6', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Musulmana'),
  ('7', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Ortodoxa'),
  ('8', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Otra religión o credo'),
  ('9', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Ninguna, ateo, agnóstico'),
  ('99', 'https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSReligion', 'Desconocido')
