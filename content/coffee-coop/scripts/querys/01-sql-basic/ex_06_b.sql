-- Exercise 06 - b
-- Farmers: farmers in Pamplona without registered email
SELECT 
    T1.document_number AS document, 
    T1.first_name AS first_name, 
    T1.last_name AS last_name, 
    T1.phone_number AS phone, 
    T1.email AS email
FROM farm.farmers AS T1
WHERE T1.municipality_code = '54518' 
  AND T1.email IS NULL;

/*
document   | first_name       | last_name        | phone      | email
-----------+------------------+------------------+------------+------
712758473  | Wilson           | López Villamizar | 3055094275 |      
727945493  | Gloria           | Marín Rivera     | 3225571567 |      
549054771  | María            | Burbano Duarte   | 3183590387 |      
24999630   | Esperanza        | Romero Betancur  | 3029623613 |      
914044314  | Ancízar Cristian | Polanía Delgado  | 3028825809 |      
343256743  | Dora             | Hernández Correa | 3166719225 |      
1148351420 | Inés             | Jiménez Jaimes   | 3104090231 |      
1117597835 | Cecilia Lorena   | Díaz García      | 3207660684 |      
749444168  | Emilio           | Delgado Molina   | 3118015821 |      
940051048  | David Germán     | Romero Bonilla   | 3018117176 |      
(10 rows)
*/