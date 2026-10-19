-- GROUP BY AND HAVING APPLICATION
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/202

/**
1. Identificación de Clientes de Alto Valor:
Calcule los totales de gastos de seis meses por cliente,
filtrando aquellos que superan los $7,750,424,420,346.32 (~7.75 billones),
incluyendo identificación completa del cliente y frecuencia de transacciones.
*/
SELECT 
   c.client_id,
   c.first_name || ' ' || COALESCE(c.middle_name || ' ', '') || c.last_name AS client_name,
   c.email,
   c.phone,
   COUNT(t.transaction_id) AS transaction_count,
   SUM(t.amount) AS total_spent
FROM 
   fintech.CLIENTS c
JOIN 
   fintech.CREDIT_CARDS cc ON c.client_id = cc.client_id
JOIN 
   fintech.TRANSACTIONS t ON cc.card_id = t.card_id
WHERE 
   t.transaction_date >= (CURRENT_DATE - INTERVAL '6 months')
   AND t.status = 'Completed'
GROUP BY 
   c.client_id, 
   c.first_name, 
   c.middle_name, 
   c.last_name, 
   c.email, 
   c.phone
HAVING 
   SUM(t.amount) > 7750424420346.32
ORDER BY 
   total_spent DESC;

/**
2. Análisis de Rendimiento de Categoría Comercial:
Analice categorías comerciales por valor promedio de transacción
por país, filtrando categorías con transacciones promedio superiores a 
$5,497,488,250,176.02 (~5.50 billones) y mínimo 50 operaciones.
**/

SELECT
	ml.category,
  AVG(tr.amount) AS avg_transactions,
  COUNT(tr.transaction_id) AS total_operations_made,
  co.name AS country
FROM 
	fintech.merchant_locations AS ml
INNER JOIN fintech.transactions AS tr
	ON ml.location_id = tr.location_id
INNER JOIN fintech.countries AS co
	ON ml.country_code = co.country_code
--WHERE ml.country_code = 'CO' optional filter by colombia
GROUP BY ml.category, co.name
HAVING AVG(tr.amount) > 5497488250176.02
	AND COUNT(tr.transaction_id) >= 50
ORDER BY total_operations_made DESC;


/**
3. Análisis de Rechazo de Transacciones:
Determine franquicias de tarjetas con tasas elevadas de rechazo de transacciones
por país, mostrando franquicia, país y porcentaje de rechazo, 
filtrado para tasas superiores al 5% con mínimo 100 intentos de transacción.
**/

/**
4. Distribución Geográfica del Método de Pago:
Analice los métodos de pago dominantes por ciudad, 
incluyendo nombre del método, ciudad, país y volumen de transacciones,
filtrado para métodos que representan más del 20% del volumen 
de transacciones de una ciudad.
**/

/**
5. Análisis de Patrones de Gasto Demográfico:
Evalúe el comportamiento de compra en demografías de género y edad,
calculando gasto total, valor promedio de transacción y frecuencia de
operación, filtrado para grupos demográficos con mínimo 30 clientes activos.
**/