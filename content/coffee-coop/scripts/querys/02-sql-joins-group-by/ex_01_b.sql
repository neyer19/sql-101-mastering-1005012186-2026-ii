/*
Exercise 01 - Literal b
Farms, rural districts, municipality, and farmer full name for municipality 54518
*/
SELECT
    T1.farm_name AS farm,
    T1.rural_district AS rural_district,
    T2.municipality_name AS municipality,
    T3.first_name AS first_name,
    T3.last_name AS last_name
FROM farm.farms AS T1
INNER JOIN geo.municipalities AS T2
    ON T1.municipality_code = T2.municipality_code
INNER JOIN farm.farmers AS T3
    ON T1.farmer_id = T3.farmer_id
WHERE T1.municipality_code = '54518'
ORDER BY T3.last_name ASC;

/*
farm        | rural_district | municipality | first_name     | last_name        
------------+----------------+--------------+----------------+------------------
El Jardín   | El Escorial    | Pamplona     | Manuel         | Agudelo Jiménez  
La Selva    | Peñas          | Pamplona     | Manuel         | Agudelo Jiménez  
El Diamante | El Alizal      | Pamplona     | Marleny        | Agudelo Sandoval 
Bellavista  | Alto Grande    | Pamplona     | Rocío          | Álvarez Cárdenas 
El Encanto  | Fontibón       | Pamplona     | Rocío          | Álvarez Cárdenas 
Monteverde  | Lengua         | Pamplona     | Mónica         | Álvarez Carrillo 
La Cabaña   | Lengua         | Pamplona     | Mónica         | Álvarez Carrillo 
El Arrayán  | Navarro        | Pamplona     | Marleny        | Álvarez Correa   
El Mango    | La Legua       | Pamplona     | Alberto        | Álvarez Villamizar
Monteverde  | La Legua       | Pamplona     | Myriam Yuliana | Arango Narváez   
(10 rows)
*/