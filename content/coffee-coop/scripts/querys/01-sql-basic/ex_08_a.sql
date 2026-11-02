-- Exercise 08 - a
-- Deliveries: received on September 30, 2026 ordered by reception time
SELECT 
    T1.delivery_id AS delivery, 
    T1.farm_id AS farm_id, 
    T1.collection_point_id AS collection_point_id, 
    T1.delivered_at AS received_at, 
    T1.coffee_type AS coffee_type, 
    T1.gross_weight_kg AS gross_weight_kg
FROM buy.deliveries AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%'
ORDER BY T1.delivered_at ASC;

/*
delivery            | farm_id | collection_point_id | received_at         | coffee_type   | gross_weight_kg
--------------------+---------+---------------------+---------------------+---------------+----------------
DLV-20260930-000001 | 121925  | 68                  | 2026-09-30 06:01:10 | dry_parchment | 51.53          
DLV-20260930-000002 | 39639   | 48                  | 2026-09-30 06:03:32 | dry_parchment | 124.98         
DLV-20260930-000003 | 228920  | 80                  | 2026-09-30 06:04:40 | wet_parchment | 112.33         
DLV-20260930-000004 | 2649    | 90                  | 2026-09-30 06:07:26 | dry_parchment | 138.29         
DLV-20260930-000005 | 163723  | 10                  | 2026-09-30 06:07:51 | dry_parchment | 256.42         
DLV-20260930-000006 | 58408   | 170                 | 2026-09-30 06:11:03 | dry_parchment | 139.81         
DLV-20260930-000007 | 201601  | 57                  | 2026-09-30 06:15:25 | dry_parchment | 404.97         
DLV-20260930-000008 | 135490  | 53                  | 2026-09-30 06:16:53 | dry_parchment | 175.92         
DLV-20260930-000009 | 108211  | 54                  | 2026-09-30 06:17:34 | dry_parchment | 56.80          
DLV-20260930-000010 | 37288   | 67                  | 2026-09-30 06:20:30 | dry_parchment | 269.43         
(10 rows)
*/