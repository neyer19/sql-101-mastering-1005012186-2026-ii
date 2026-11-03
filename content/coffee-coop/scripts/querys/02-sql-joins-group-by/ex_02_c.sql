/*
Exercise 02 - Literal c
Deliveries on September 30, 2026 with quality analysis details
*/
SELECT
    T1.delivery_id AS delivery,
    T2.analysis_id AS analysis,
    T2.cup_score AS cup_score
FROM buy.deliveries AS T1
LEFT JOIN buy.quality_analyses AS T2
    ON T1.delivery_id = T2.delivery_id
WHERE T1.delivery_id LIKE 'DLV-20260930-%'
ORDER BY T1.delivery_id ASC;

/*
delivery            | analysis           | cup_score
--------------------+--------------------+----------
DLV-20260930-000001 |                    |          
DLV-20260930-000002 |                    |          
DLV-20260930-000003 | QA-20260930-000001 |          
DLV-20260930-000004 | QA-20260930-000002 |          
DLV-20260930-000005 | QA-20260930-000026 | 78.56    
DLV-20260930-000006 | QA-20260930-000018 | 79.98    
DLV-20260930-000007 |                    |          
DLV-20260930-000008 | QA-20260930-000007 |          
DLV-20260930-000009 |                    |          
DLV-20260930-000010 | QA-20260930-000006 |          
(10 rows)
*/