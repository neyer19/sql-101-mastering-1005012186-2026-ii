-- Exercise 05 - c
-- Collection points: inactive OR missing phone number
SELECT 
    T1.point_name AS point, 
    T1.address_line AS address, 
    T1.municipality_code AS municipality_code, 
    T1.phone_number AS phone_number, 
    T1.is_active AS is_active
FROM buy.collection_points AS T1
WHERE T1.is_active = FALSE 
   OR T1.phone_number IS NULL;

/*
point                       | address                | municipality_code | phone_number | is_active
----------------------------+------------------------+-------------------+--------------+----------
Punto de Compra El Banco 1  | Calle 17 # 34-54       | 47245             | 6055026534   | false    
Punto de Compra Popayán 1   | Carrera 21 # 4-95      | 19001             | 6057341141   | false    
Punto de Compra Hatonuevo 1 | Calle 7 # 16-89        | 44378             |              | true     
Punto de Compra Bosconia 1  | Carrera 26 # 26-43     | 20060             |              | true     
Punto de Compra Cajibío 1   | Carrera 15 # 32-45     | 19130             |              | true     
Punto de Compra Anserma 1   | Calle 39 # 7-96        | 17042             |              | true     
Punto de Compra Apía 2      | Calle 9 # 14-56        | 66045             |              | false    
Punto de Compra Puracé 1    | Calle 16 # 50-5        | 19585             |              | true     
Punto de Compra Aipe 1      | Carrera 13 # 17-16     | 41016             |              | true     
Punto de Compra Marsella 1  | Transversal 19 # 42-92 | 66440             |              | true     
(10 rows)
*/