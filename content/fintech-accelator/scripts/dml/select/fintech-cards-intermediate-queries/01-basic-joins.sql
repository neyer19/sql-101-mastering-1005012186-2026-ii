-- JOINS APPLICATION
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/2025

/**
1. Consulta de Relación de Entidades:
Construya una vista integral de transacciones con detalles de cliente asociados, 
incluyendo nombre del cliente, monto de la transacción, 
nombre del comercio y método de pago.
**/

-- JOIN (transactions -> merchant_locations -> credit_cards -> clients ->payment_methods)
SELECT 
    (cl.first_name ||' '||COALESCE(cl.middle_name, '')||' '||cl.last_name) AS client,
    tr.amount AS transaction_amount,
    ml.store_name AS purchased_store,
    pm.name AS payment_method

FROM fintech.transactions AS tr
    INNER JOIN fintech.merchant_locations AS ml
    ON tr.location_id = ml.location_id
    INNER JOIN fintech.credit_cards AS cc
    ON tr.card_id = cc.card_id
    INNER JOIN fintech.clients AS cl
    ON cl.client_id = cc.client_id
    INNER JOIN fintech.payment_methods AS pm
    ON tr.method_id = pm.method_id

LIMIT 10;

/**
2. Análisis de Relación Cliente-Tarjeta:
Genere una lista completa de clientes y sus tarjetas de crédito asociadas,
asegurando la inclusión de clientes sin tarjetas registradas.
**/


/**
3. Análisis de Transacciones Comerciales:
Desarrolle una consulta para mostrar todas las ubicaciones comerciales 
y sus transacciones asociadas, incluidas las ubicaciones sin actividad
 de transacciones registrada.
**/

/**
4. Distribución Geográfica de Franquicias:
Cree una consulta para analizar franquicias y sus países de operación, 
incluidas franquicias sin asociaciones de país y países sin franquicias activas.
**/

/**
5. Detección de Patrones de Transacciones Recurrentes:
Implemente una consulta self-join para identificar pares
de transacciones del mismo cliente en la misma ubicación comercial 
en diferentes fechas, revelando comportamientos de compra recurrentes.
**/

