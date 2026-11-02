-- Exercise 01 - b
-- Departments: code and name with column aliases
SELECT
T1.department_code AS code,
T1.department_name AS department
FROM geo.departments AS T1;

/*
department_code | department_name
----------------+------------------
05              | Antioquia
08              | Atlántico
11              | Bogotá, D.C.
13              | Bolívar
15              | Boyacá
17              | Caldas
18              | Caquetá
19              | Cauca
20              | Cesar
23              | Córdoba
(33 rows)
*/