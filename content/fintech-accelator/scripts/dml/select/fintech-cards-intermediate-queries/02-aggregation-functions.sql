-- AGGREGATION FUNCTIONS APPLICATIONS
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/2025


/**
1. Análisis de Gastos del Cliente:
Calcule los montos totales de transacciones 
por cliente dentro del período de tres meses más reciente, 
mostrando identificación del cliente y gasto total.
**/
-- FK: (transactions -> credit_cards -> clients)
SELECT
	cl.client_id,
    (cl.first_name ||' '||cl.last_name) AS client,
    COUNT(*) AS total_transactions_done,
    SUM(tr.amount) AS total_amount_spent
FROM 
    fintech.transactions AS tr
INNER JOIN fintech.credit_cards AS cc
    ON tr.card_id = cc.card_id
INNER JOIN fintech.clients AS cl
    ON cc.client_id = cl.client_id
WHERE 
    tr.transaction_date >= (CURRENT_DATE - INTERVAL '3 months')
GROUP BY cl.client_id, cl.first_name, cl.last_name
ORDER BY cl.client_id DESC
LIMIT 5;



/**
2. Distribución de Valor de Transacción:
Determine los valores promedio de transacciones agrupados 
por categoría de comercio y método de pago para identificar 
patrones de gasto en diferentes tipos de establecimientos.
**/

SELECT
	AVG(t3.amount) AS avg_transaction,
  t4.category AS commerce_category,
  t5.name AS payment_method,
  COUNT(*) AS transaction_count

FROM fintech.clients t1
INNER JOIN 
		fintech.credit_cards t2 ON t1.client_id = t2.client_id
INNER JOIN 
		fintech.transactions t3 ON t2.card_id = t3.card_id
INNER JOIN 
		fintech.merchant_locations t4 ON t4.location_id = t3.location_id
INNER JOIN
		fintech.payment_methods t5 ON t5.method_id = t3.method_id

GROUP BY t4.category, t5.name
LIMIT 10;

/**
3. Distribución de Emisión de Tarjetas:
Cuantifique las tarjetas de crédito emitidas por cada institución financiera,
categorizadas por franquicia, para determinar la penetración de 
mercado por tipo de tarjeta.
**/
SELECT
	t2.name AS issuer,
  t1.name AS franquise,
  COUNT(t3.card_id) AS total_cards_issued 

FROM fintech.franchises t1
INNER JOIN
		 fintech.issuers t2 ON t2.issuer_id = t1.issuer_id
INNER JOIN
		 fintech.credit_cards t3 ON t3.franchise_id = t1.franchise_id
-- WHERE t3.status = 'Activate' optional   
GROUP BY t2.name, t1.name
ORDER BY total_cards_issued DESC
LIMIT 10;
/**
4. Análisis de Límites de Gasto:
Identifique los montos de transacción mínimos 
y máximos para cada cliente junto con las fechas correspondientes 
para establecer patrones de rango de gasto.
**/

SELECT
    CONCAT(t1.first_name, ' ', COALESCE(t1.middle_name, ''), ' ', t1.last_name) AS client,
    MIN(t3.amount) AS lower_amount,
    (SELECT 
        transaction_date 
     FROM 
        fintech.transactions t_min 
     JOIN 
        fintech.credit_cards cc ON t_min.card_id = cc.card_id 
     WHERE 
        cc.client_id = t1.client_id 
     AND 
        t_min.amount = MIN(t3.amount) 
     LIMIT 1) AS lower_amount_date,
    MAX(t3.amount) AS higher_amount,
    (SELECT 
        transaction_date 
     FROM 
        fintech.transactions t_max 
     JOIN 
        fintech.credit_cards cc ON t_max.card_id = cc.card_id 
     WHERE 
        cc.client_id = t1.client_id 
     AND 
        t_max.amount = MAX(t3.amount) 
     LIMIT 1) AS higher_amount_date,
    COUNT(*) AS total_transactions
FROM fintech.clients t1
INNER JOIN 
    fintech.credit_cards t2 ON t1.client_id = t2.client_id
INNER JOIN 
    fintech.transactions t3 ON t2.card_id = t3.card_id
GROUP BY t1.client_id, t1.first_name, t1.middle_name, t1.last_name
LIMIT 10;