-- Exercise 07 - c
-- Farms: missing geographic coordinates in Pamplona
SELECT 
    T1.farm_name AS farm, 
    T1.rural_district AS rural_district, 
    T1.latitude AS latitude, 
    T1.longitude AS longitude
FROM farm.farms AS T1
WHERE T1.municipality_code = '54518' 
  AND (T1.latitude IS NULL OR T1.longitude IS NULL);

/*
farm          | rural_district     | latitude | longitude
--------------+--------------------+----------+----------
El Recuerdo   | Alto Grande        |          |          
La Esperanza  | El Palchal         |          |          
Las Delicias  | Caima              |          |          
Los Arrayanes | Cabecera Municipal |          |          
El Brillante  | Peñas              |          |          
El Porvenir   | Fontibón           |          |          
La Florida    | Peñas              |          |          
Los Arrayanes | Navarro            |          |          
El Guayabo    | San Francisco      |          |          
El Encanto    | Fontibón           |          |          
(10 rows)
*/
