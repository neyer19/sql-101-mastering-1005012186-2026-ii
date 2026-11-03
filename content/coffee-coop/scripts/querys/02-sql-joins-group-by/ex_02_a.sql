/*
Exercise 02 - Literal a
All farmers from municipality 54518 with their farm name (if any)
*/
SELECT
    T1.document_number AS document,
    T1.first_name AS first_name,
    T1.last_name AS last_name,
    T2.farm_name AS farm
FROM farm.farmers AS T1
LEFT JOIN farm.farms AS T2
    ON T1.farmer_id = T2.farmer_id
WHERE T1.municipality_code = '54518';

/*
document   | first_name      | last_name        | farm         
-----------+-----------------+------------------+--------------
1061690671 | Guillermo Pedro | Arias Rodríguez  | La Selva     
712758473  | Wilson          | López Villamizar | El Silencio  
134410171  | Orlando         | Salazar Bermúdez | El Diamante  
870240973  | Jairo           | Molina Pabón     | El Recuerdo  
727945493  | Gloria          | Marín Rivera     | La Esperanza 
549054771  | María           | Burbano Duarte   | El Nogal     
549054771  | María           | Burbano Duarte   | La Divisa    
622105662  | Alejandra       | Molina Torres    | La Carolina  
622105662  | Alejandra       | Molina Torres    | La Cristalina
622105662  | Alejandra       | Molina Torres    | Villa Rosa   
(10 rows)
*/