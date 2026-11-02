/*
Exercise 07 - Literal b
Summary of quality metrics for analyses on September 30, 2026
*/
SELECT
    MIN(T1.cup_score) AS min_cup_score,
    MAX(T1.cup_score) AS max_cup_score,
    ROUND(AVG(T1.cup_score), 2) AS avg_cup_score,
    MIN(T1.moisture_pct) AS min_moisture_pct,
    MAX(T1.moisture_pct) AS max_moisture_pct
FROM buy.quality_analyses AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%';

/*
min_cup_score | max_cup_score | avg_cup_score | min_moisture_pct | max_moisture_pct
--------------+---------------+---------------+------------------+-----------------
77.17         | 87.28         | 82.91         | 8.39             | 17.68           
(1 row)
*/