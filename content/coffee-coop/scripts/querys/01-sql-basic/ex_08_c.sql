-- Exercise 08 - c
-- Deliveries: coffee type wet_parchment or cherry using IN
SELECT 
    T1.delivery_id AS delivery, 
    T1.farm_id AS farm_id, 
    T1.coffee_type AS coffee_type, 
    T1.gross_weight_kg AS gross_weight_kg
FROM buy.deliveries AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%' 
  AND T1.coffee_type IN ('wet_parchment', 'cherry')
ORDER BY T1.gross_weight_kg DESC;

/*
delivery            | farm_id | coffee_type   | gross_weight_kg
--------------------+---------+---------------+----------------
DLV-20260930-000081 | 19338   | cherry        | 475.13         
DLV-20260930-000187 | 231839  | cherry        | 339.30         
DLV-20260930-000105 | 13478   | wet_parchment | 277.63         
DLV-20260930-000028 | 182397  | wet_parchment | 258.00         
DLV-20260930-000133 | 44726   | cherry        | 254.83         
DLV-20260930-000094 | 99627   | cherry        | 246.96         
DLV-20260930-000129 | 89312   | wet_parchment | 206.71         
DLV-20260930-000161 | 101318  | wet_parchment | 197.04         
DLV-20260930-000046 | 85553   | wet_parchment | 186.73         
DLV-20260930-000248 | 215660  | cherry        | 159.89         
(10 rows)
*/
