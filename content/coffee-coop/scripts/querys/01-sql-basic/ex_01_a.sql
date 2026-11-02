-- Exercise 01 - a
-- Departments: select all columns and rows
SELECT 
    T1.department_code, 
    T1.department_name
FROM geo.departments AS T1;

/*
	
"department_code"  | "department_name"
------+-------------------
05    | Antioquia
08    | Atlántico
11    | Bogotá, D.C.
13    | Bolívar
15    | Boyacá
17    | Caldas
18    | Caquetá
19    | Cauca
20    | Cesar
23    | Córdoba
(33 rows)
*/