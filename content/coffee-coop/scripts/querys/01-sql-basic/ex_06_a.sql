-- Exercise 06 - a
-- Farmers: female farmers in Pamplona (54518) ordered by last and first name
SELECT 
    T1.document_number AS document, 
    T1.first_name AS first_name, 
    T1.last_name AS last_name, 
    T1.phone_number AS phone
FROM farm.farmers AS T1
WHERE T1.municipality_code = '54518' 
  AND T1.gender = 'F'
ORDER BY T1.last_name ASC, T1.first_name ASC;

/*
document   | first_name      | last_name        | phone     
-----------+-----------------+------------------+-----------
768461420  | Marleny         | Agudelo Sandoval | 3242280898
931079279  | Edilma          | Álvarez Bonilla  | 3236902029
463842401  | Rocío           | Álvarez Cárdenas | 3047898372
788628125  | Mónica          | Álvarez Carrillo | 3059237130
939635303  | Marleny         | Álvarez Correa   | 3232410671
1089620113 | Myriam Yuliana  | Arango Narváez   | 3178267449
172555225  | Edilma Gabriela | Arias Álvarez    | 3213658326
550696749  | Viviana         | Arias Ramírez    | 3204850778
797017145  | Isabella        | Barrera Cabrera  | 3041744702
659942505  | Mariana         | Barrera Correa   | 3126485460
(10 rows)
*/