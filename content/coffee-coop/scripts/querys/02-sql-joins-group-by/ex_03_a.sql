/*
Exercise 03 - Literal a
Collection points activity on September 30, 2026 using RIGHT JOIN
*/
SELECT
    T2.point_name AS collection_point,
    T1.delivery_id AS delivery,
    T1.gross_weight_kg AS gross_weight_kg
FROM buy.deliveries AS T1
RIGHT JOIN buy.collection_points AS T2
    ON T1.collection_point_id = T2.collection_point_id
   AND T1.delivery_id LIKE 'DLV-20260930-%';

/*
collection_point                             | delivery            | gross_weight_kg
---------------------------------------------+---------------------+----------------
Punto de Compra Jambaló 1                    | DLV-20260930-000001 | 51.53          
Punto de Compra El Playón 1                  | DLV-20260930-000083 | 89.95          
Punto de Compra San Sebastián De Mariquita 1 | DLV-20260930-000084 | 131.42         
Punto de Compra La Merced 1                  | DLV-20260930-000085 | 239.20         
Punto de Compra Nátaga 1                     | DLV-20260930-000086 | 84.05          
Punto de Compra Algeciras 1                  | DLV-20260930-000087 | 116.95         
Punto de Compra Confines 1                   | DLV-20260930-000088 | 220.61         
Punto de Compra Villarrica 1                 | DLV-20260930-000089 | 229.80         
Punto de Compra Sevilla 1                    | DLV-20260930-000090 | 154.09         
Punto de Compra Abriaquí 1                   | DLV-20260930-000164 | 48.18          
(10 rows)
*/