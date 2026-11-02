-- Exercise 07 - a
-- Farms: altitude above 1800 masl in Pamplona
SELECT 
    T1.farm_name AS farm, 
    T1.rural_district AS rural_district, 
    T1.total_area_ha AS area_ha, 
    T1.altitude_masl AS altitude_masl
FROM farm.farms AS T1
WHERE T1.municipality_code = '54518' 
  AND T1.altitude_masl > 1800
ORDER BY T1.altitude_masl DESC;

/*
farm          | rural_district | area_ha | altitude_masl
--------------+----------------+---------+--------------
Santa Clara   | La Legua       | 2.62    | 2300         
El Guayabo    | El Rosal       | 1.21    | 2300         
La Cascada    | Caima          | 2.49    | 2300         
El Vergel     | Sabagua        | 1.11    | 2300         
La Isabela    | García         | 1.36    | 2275         
El Refugio    | Monteadentro   | 4.89    | 2242         
Cafetal Viejo | Caima          | 5.29    | 2229         
San José      | Alcaparral     | 3.12    | 2203         
El Refugio    | Sabaneta Baja  | 1.93    | 2195         
Villa Hermosa | Peñas          | 0.30    | 2181         
(10 rows)
*/