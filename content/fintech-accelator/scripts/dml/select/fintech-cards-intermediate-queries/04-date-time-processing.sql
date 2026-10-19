-- DATES PROCESSING APPLICATION
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/2025

/**
1. Análisis de Tarjetas Vencidas:
Cree una consulta que muestre todos los clientes que tienen
tarjetas de crédito vencidas a la fecha actual, 
incluyendo el nombre del cliente y la fecha de vencimiento de la tarjeta.
**/
SELECT 
   c.client_id,
   c.first_name || ' ' || COALESCE(c.middle_name || ' ', '') || c.last_name AS client_name,
   cc.card_id,
   cc.expiration_date
FROM 
   fintech.CLIENTS c
JOIN 
   fintech.CREDIT_CARDS cc ON c.client_id = cc.client_id
WHERE 
   cc.expiration_date < CURRENT_DATE
   AND cc.status <> 'Canceled'
ORDER BY 
   cc.expiration_date DESC;
/**
2. Antigüedad de Transacciones:
Desarrolle una consulta que calcule la antigüedad
de todas las transacciones completadas,
ordenándolas desde la más reciente hasta la más antigua,
mostrando el monto, el nombre del cliente y la antigüedad.
**/
SELECT 
   t.transaction_id,
   t.amount,
   c.first_name || ' ' || COALESCE(c.middle_name || ' ', '') || c.last_name AS client_name,
   t.transaction_date,
   CURRENT_DATE - t.transaction_date::date AS transaction_age_days
FROM 
   fintech.TRANSACTIONS t
JOIN 
   fintech.CREDIT_CARDS cc ON t.card_id = cc.card_id
JOIN 
   fintech.CLIENTS c ON cc.client_id = c.client_id
WHERE 
   t.status = 'Completed'
ORDER BY 
   t.transaction_date DESC;

/**
3. Análisis de Transacciones por Mes:
Genere un informe que muestre el total de transacciones agrupadas por mes,
incluyendo el monto total y el número de transacciones por mes
**/
SELECT
	TO_CHAR(DATE_TRUNC('month', transaction_date), 'Month') as month,
	DATE_TRUNC('month', transaction_date) AS month_transaction,
	COUNT(*) total_transactions,
    SUM(amount) total_amount
   
FROM 
    fintech.transactions
GROUP BY 
    month_transaction, month
ORDER BY 
    month_transaction;

/**
4. Transacciones en las Últimas 24 Horas:
Elabore una consulta que identifique las transacciones realizadas
en las últimas 24 horas, mostrando los detalles del cliente, el comercio
y el método de pago utilizado.
**/
SELECT 
    t.transaction_id,
    c.first_name || ' ' || c.last_name AS cliente,
    t.amount,
    t.currency,
    t.transaction_date,
    NOW() AS momento_actual,
    (NOW() - t.transaction_date) AS tiempo_transcurrido
FROM 
    fintech.TRANSACTIONS t
JOIN 
    fintech.CREDIT_CARDS cc ON t.card_id = cc.card_id
JOIN 
    fintech.CLIENTS c ON cc.client_id = c.client_id
WHERE 
    t.transaction_date > (NOW() - INTERVAL '24 hours')
ORDER BY 
    t.transaction_date DESC;

/**
5. Patrones de Gasto por Día de la Semana:
Construya un análisis que muestre el promedio de gasto 
por día de la semana, agrupando las transacciones por el día 
y ordenando por el promedio de gasto de mayor a menor.
**/
-- Análisis de patrones de gasto por día de la semana
SELECT 
    TO_CHAR(transaction_date, 'Day') AS day_of_week,
    EXTRACT(DOW FROM transaction_date) AS day_number,
    COUNT(*) AS transaction_count,
    AVG(amount) AS average_spending,
    SUM(amount) AS total_spending
FROM 
    fintech.TRANSACTIONS
GROUP BY 
    TO_CHAR(transaction_date, 'Day'),
    EXTRACT(DOW FROM transaction_date)
ORDER BY 
    AVG(amount) DESC;