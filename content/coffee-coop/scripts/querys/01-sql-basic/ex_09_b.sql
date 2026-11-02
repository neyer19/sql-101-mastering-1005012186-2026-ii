-- Exercise 09 - b
-- Quality analyses: moisture percentage outside 10%-12% (NOT BETWEEN)
SELECT 
    T1.analysis_id AS analysis, 
    T1.delivery_id AS delivery, 
    T1.moisture_pct AS moisture_pct, 
    T1.analyst_name AS analyst_name, 
    T1.observations AS observations
FROM buy.quality_analyses AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%' 
  AND T1.moisture_pct NOT BETWEEN 10 AND 12;

/*
analysis           | delivery            | moisture_pct | analyst_name     | observations                                  
-------------------+---------------------+--------------+------------------+-----------------------------------------------
QA-20260930-000026 | DLV-20260930-000005 | 12.19        | Wilson Galvis    |                                               
QA-20260930-000018 | DLV-20260930-000006 | 17.24        | Nicolás Serrano  | Café con humedad alta, requiere más secado.   
QA-20260930-000017 | DLV-20260930-000012 | 12.15        | Natalia Trujillo |                                               
QA-20260930-000033 | DLV-20260930-000027 | 12.41        | Sara Sánchez     |                                               
QA-20260930-000013 | DLV-20260930-000038 | 12.28        | Adriana Losada   |                                               
QA-20260930-000005 | DLV-20260930-000040 | 12.22        | Iván Castro      |                                               
QA-20260930-000027 | DLV-20260930-000043 | 12.07        | Germán González  | Caficultor solicita contramuestra.            
QA-20260930-000144 | DLV-20260930-000289 | 12.28        | Ancízar Delgado  |                                               
QA-20260930-000137 | DLV-20260930-000295 | 12.35        | Sara Sánchez     |                                               
QA-20260930-000023 | DLV-20260930-000046 | 12.23        | Alejandra Torres | Café de buena presentación, sin olores extraños.
(10 rows)
*/