/*
Exercise 01 - Literal a
Municipalities of Norte de Santander with department name
*/
SELECT
    T1.municipality_code AS municipality_code,
    T1.municipality_name AS municipality,
    T2.department_name AS department
FROM geo.municipalities AS T1
INNER JOIN geo.departments AS T2
    ON T1.department_code = T2.department_code
WHERE T1.department_code = '54'
ORDER BY T1.municipality_name ASC;

/*
municipality_code | municipality | department        
------------------+--------------+-------------------
54003             | Ábrego       | Norte De Santander
54051             | Arboledas    | Norte De Santander
54099             | Bochalema    | Norte De Santander
54109             | Bucarasica   | Norte De Santander
54128             | Cáchira      | Norte De Santander
54125             | Cácota       | Norte De Santander
54172             | Chinácota    | Norte De Santander
54174             | Chitagá      | Norte De Santander
54206             | Convención   | Norte De Santander
54001             | Cúcuta       | Norte De Santander
(10 rows)
*/