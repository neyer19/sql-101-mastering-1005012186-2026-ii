-- Exercise 01 - c
-- Departments: code and name ordered alphabetically by department name
SELECT 
    T1.department_code AS code, 
    T1.department_name AS department
FROM geo.departments AS T1
ORDER BY T1.department_name ASC;


/*
code | department
-----+------------------------------------------------------
91   | Amazonas
05   | Antioquia
81   | Arauca
88   | Archipiélago De San Andrés, Providencia Y Santa Catalina
08   | Atlántico
11   | Bogotá, D.C.
13   | Bolívar
15   | Boyacá
17   | Caldas
18   | Caquetá
(33 rows)
*/