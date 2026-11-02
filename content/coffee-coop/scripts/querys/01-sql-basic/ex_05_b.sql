-- Exercise 05 - b
-- Collection points: missing phone number ordered by name
SELECT 
    T1.point_name AS point, 
    T1.address_Line AS address, 
    T1.municipality_code AS municipality_code
FROM buy.collection_points AS T1
WHERE T1.phone_number IS NULL
ORDER BY T1.point_name ASC;

/*
point                       | address                | municipality_code
----------------------------+------------------------+------------------
Punto de Compra Aipe 1      | Carrera 13 # 17-16     | 41016            
Punto de Compra Anserma 1   | Calle 39 # 7-96        | 17042            
Punto de Compra Apía 2      | Calle 9 # 14-56        | 66045            
Punto de Compra Baraya 1    | Calle 1 # 19-77        | 41078            
Punto de Compra Bochalema 1 | Carrera 25 # 47-89     | 54099            
Punto de Compra Bosconia 1  | Carrera 26 # 26-43     | 20060            
Punto de Compra Cajibío 1   | Carrera 15 # 32-45     | 19130            
Punto de Compra Cisneros 1  | Calle 37 # 10-5        | 05190            
Punto de Compra Coello 1    | Transversal 20 # 49-66 | 73200            
Punto de Compra El Carmen 2 | Calle 3 # 34-88        | 54245            
(10 rows)
*/