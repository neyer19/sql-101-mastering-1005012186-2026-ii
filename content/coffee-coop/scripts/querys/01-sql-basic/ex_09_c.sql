-- Exercise 09 - c
-- Quality analyses: unaccepted samples with registered notes
SELECT 
    T1.analysis_id AS analysis, 
    T1.delivery_id AS delivery, 
    T1.is_accepted AS is_accepted, 
    T1.defects_pct AS defects_pct, 
    T1.observations AS observations
FROM buy.quality_analyses AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%' 
  AND T1.is_accepted = FALSE 
  AND T1.observations IS NOT NULL
ORDER BY T1.defects_pct DESC;

/*
analysis           | delivery            | is_accepted | defects_pct | observations                               
-------------------+---------------------+-------------+-------------+--------------------------------------------
QA-20260930-000104 | DLV-20260930-000214 | false       | 19.54       | Olor a fermento en la muestra.             
QA-20260930-000068 | DLV-20260930-000165 | false       | 17.29       | Muestra tomada por duplicado.              
QA-20260930-000119 | DLV-20260930-000253 | false       | 15.59       | Exceso de impurezas y pasilla.             
QA-20260930-000086 | DLV-20260930-000147 | false       | 13.21       | Olor a fermento en la muestra.             
QA-20260930-000113 | DLV-20260930-000223 | false       | 12.94       | Café sobresecado, grano quebradizo.        
QA-20260930-000022 | DLV-20260930-000070 | false       | 9.75        | Café con humedad alta, requiere más secado.
QA-20260930-000018 | DLV-20260930-000006 | false       | 7.88        | Café con humedad alta, requiere más secado.
(7 rows)
*/