-- Exercise 10 - b
-- Settlements: pending settlements ordered by net amount descending
SELECT 
    T1.settlement_id AS settlement, 
    T1.delivery_id AS delivery, 
    T1.net_amount AS net_cop, 
    T1.status AS status
FROM pay.settlements AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%' 
  AND T1.status = 'pending'
ORDER BY T1.net_amount DESC;

/*
settlement          | delivery            | net_cop    | status 
--------------------+---------------------+------------+--------
STL-20261001-000040 | DLV-20260930-000256 | 6094824.45 | pending
STL-20261001-000057 | DLV-20260930-000105 | 6051013.94 | pending
STL-20261003-000007 | DLV-20260930-000116 | 5349871.04 | pending
STL-20261002-000004 | DLV-20260930-000010 | 5347247.03 | pending
STL-20260930-000069 | DLV-20260930-000204 | 5013706.66 | pending
STL-20261003-000001 | DLV-20260930-000023 | 4965142.70 | pending
STL-20261002-000042 | DLV-20260930-000152 | 4693178.85 | pending
STL-20261003-000012 | DLV-20260930-000286 | 4135855.75 | pending
STL-20261002-000033 | DLV-20260930-000189 | 4023811.68 | pending
STL-20261001-000033 | DLV-20260930-000179 | 3978665.28 | pending
(10 rows)
*/