/*
Exercise 09 - Literal c
Farms with at least 3 analyses and average cup score >= 84
*/
SELECT
    T3.farm_name AS farm,
    COUNT(T1.analysis_id) AS analyses_count,
    ROUND(AVG(T1.cup_score), 2) AS avg_cup_score
FROM buy.quality_analyses AS T1
INNER JOIN buy.deliveries AS T2
    ON T1.delivery_id = T2.delivery_id
INNER JOIN farm.farms AS T3
    ON T2.farm_id = T3.farm_id
GROUP BY T3.farm_name
HAVING COUNT(T1.analysis_id) >= 3
   AND AVG(T1.cup_score) >= 84
ORDER BY avg_cup_score DESC;

farm             | analyses_count | avg_cup_score
