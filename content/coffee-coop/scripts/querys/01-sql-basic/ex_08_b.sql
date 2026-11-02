-- Exercise 08 - b
-- Deliveries: rejected deliveries with calculated average kg per bag
SELECT 
    T1.delivery_id AS delivery, 
    T1.farm_id AS farm_id, 
    T1.gross_weight_kg AS gross_weight_kg, 
    T1.bag_count AS bag_count, 
    (T1.gross_weight_kg / T1.bag_count) AS avg_kg_per_bag, 
    T1.status AS status
FROM buy.deliveries AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%' 
  AND T1.status = 'rejected';

/*
delivery            | farm_id | gross_weight_kg | bag_count | avg_kg_per_bag      | status  
--------------------+---------+-----------------+-----------+---------------------+---------
DLV-20260930-000083 | 66435   | 89.95           | 2         | 44.9750000000000000 | rejected
DLV-20260930-000109 | 216626  | 311.88          | 5         | 62.3760000000000000 | rejected
DLV-20260930-000006 | 58408   | 139.81          | 3         | 46.6033333333333333 | rejected
DLV-20260930-000070 | 69157   | 147.13          | 3         | 49.0433333333333333 | rejected
DLV-20260930-000147 | 77310   | 66.42           | 1         | 66.4200000000000000 | rejected
DLV-20260930-000165 | 107038  | 348.59          | 6         | 58.0983333333333333 | rejected
DLV-20260930-000214 | 223116  | 177.63          | 3         | 59.2100000000000000 | rejected
DLV-20260930-000223 | 216415  | 338.32          | 7         | 48.3314285714285714 | rejected
DLV-20260930-000253 | 143807  | 253.15          | 5         | 50.6300000000000000 | rejected
(9 rows)
*/