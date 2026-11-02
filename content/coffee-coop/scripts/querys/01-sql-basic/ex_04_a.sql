-- Exercise 04 - a
-- Municipalities: Norte de Santander (54) ordered alphabetically
SELECT 
    T1.municipality_code AS municipality_code, 
    T1.municipality_name AS municipality
FROM geo.municipalities AS T1
WHERE T1.department_code = '54'
ORDER BY T1.municipality_name ASC;
/*
municipality_code | municipality
------------------+--------------
54003             | Ábrego
54051             | Arboledas
54099             | Bochalema
54109             | Bucarasica
54128             | Cáchira
54125             | Cácota
54172             | Chinácota
54174             | Chitagá
54206             | Convención
54001             | Cúcuta
(10 rows)
*/