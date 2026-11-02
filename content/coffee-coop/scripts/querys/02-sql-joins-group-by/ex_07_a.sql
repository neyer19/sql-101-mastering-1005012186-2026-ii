/*
Exercise 07 - Literal a
Summary of deliveries on September 30, 2026
*/
SELECT
    COUNT(T1.delivery_id) AS total_deliveries,
    SUM(T1.gross_weight_kg) AS total_gross_kg,
    ROUND(AVG(T1.gross_weight_kg), 2) AS avg_gross_kg,
    COUNT(DISTINCT T1.farm_id) AS farms_delivering
FROM buy.deliveries AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%';

/*
total_deliveries | total_gross_kg | avg_gross_kg | farms_delivering
-----------------+----------------+--------------+-----------------
300              | 52190.96       | 173.97       | 300             
(1 row)
*/