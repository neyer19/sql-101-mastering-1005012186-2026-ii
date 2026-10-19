-- DATES PROCESSING APPLICATION
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/2025

/**
1. Normalización de Nombres:
Cree una consulta que muestre los nombres de los clientes y nombres de comercios
en mayúsculas, junto con el monto de sus transacciones más recientes, 
ordenados por monto.
**/
SELECT 
	UPPER(t1.first_name||' '||t1.last_name) AS full_name,
  UPPER(t4.store_name) AS commerce,
  t3.amount,
  t3.transaction_date
FROM fintech.clients t1
INNER JOIN fintech.credit_cards t2
ON t1.client_id = t2.client_id
INNER JOIN fintech.transactions t3
ON t2.card_id = t3.card_id
INNER JOIN fintech.merchant_locations t4
ON t4.location_id = t3.location_id
ORDER BY t3.amount DESC
LIMIT 5;
/**
2. Búsqueda de Transacciones por Categoría:
Desarrolle una consulta que busque transacciones en comercios 
cuya categoría contenga la palabra "Boutique", 
mostrando el nombre del cliente, fecha y monto.
**/
SELECT
  	(t1.first_name||' '||t1.last_name) AS full_name,
  	t3.amount,
  	t3.transaction_date

FROM fintech.clients t1
INNER JOIN fintech.credit_cards t2
ON t1.client_id = t2.client_id
INNER JOIN fintech.transactions t3
ON t2.card_id = t3.card_id
INNER JOIN fintech.merchant_locations t4
ON t4.location_id = t3.location_id
WHERE  t4.category = 'Boutique'
LIMIT 10;
/**
3. Formateo de Nombres Completos:
Genere un listado de tarjetas que muestre un campo con el nombre 
completo del cliente y el estado de su tarjeta.
**/

SELECT
	CONCAT(t1.first_name,' ',COALESCE(t1.middle_name,' '),' ', t1.last_name) AS full_name,
  t2.status AS credit_card_status
FROM fintech.clients t1
INNER JOIN fintech.credit_cards t2
ON t1.client_id = t2.client_id
LIMIT 10;


/**
4. Identificación de Correos Electrónicos Cortos:
Elabore una consulta que identifique clientes con direcciones
de correo electrónico cortas (menos de 15 caracteres), 
mostrando el nombre del cliente y la longitud del correo.
**/
SELECT 
	CONCAT(first_name,' ',COALESCE(middle_name,' '),' ', last_name) AS full_name,
	LENGTH(email) AS length_email
FROM 
    fintech.clients
GROUP BY 
    full_name, length_email
HAVING 
	  LENGTH(email) < 15
ORDER BY 
    length_email DESC
LIMIT
	   10;
/**
5. Análisis de Dominios de Correo:
Construya un análisis que extraiga el dominio del correo electrónico
de cada cliente, agrupando por dominio y contando 
cuántos clientes usan cada servicio de correo.
**/

-- SPLIT_PART(email,'@',2) as email_domain
SELECT 
	SPLIT_PART(email,'@',2) AS email_domain,
    COUNT(*) AS total_service_domain
FROM 
    fintech.clients
GROUP BY 
    email_domain
ORDER BY 
    total_service_domain DESC;