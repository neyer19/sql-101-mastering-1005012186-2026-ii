-- 5. FUNCIÓN PARA ANÁLISIS GEOGRÁFICO
-- Obtiene estadísticas del top de países por volumen de transacciones
CREATE OR REPLACE FUNCTION fintech.get_top_countries_by_volume(
    p_limit INT DEFAULT 10,
    p_start_date DATE DEFAULT CURRENT_DATE - INTERVAL '30 days',
    p_end_date DATE DEFAULT CURRENT_DATE
)
RETURNS TABLE (
    country_name VARCHAR(100),
    country_code VARCHAR(3),
    region_name VARCHAR(100),
    transaction_count BIGINT,
    total_volume DECIMAL(15,2),
    avg_transaction_amount DECIMAL(15,2),
    unique_clients BIGINT
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        co.name,
        co.country_code,
        r.name,
        COUNT(t.transaction_id),
        SUM(t.amount),
        AVG(t.amount),
        COUNT(DISTINCT cc.client_id)
    FROM fintech.transactions t
    JOIN fintech.merchant_locations ml ON t.location_id = ml.location_id
    JOIN fintech.countries co ON ml.country_code = co.country_code
    LEFT JOIN fintech.regions r ON co.region_id = r.region_id
    JOIN fintech.credit_cards cc ON t.card_id = cc.card_id
    WHERE t.transaction_date::DATE BETWEEN p_start_date AND p_end_date
      AND t.status = 'Completed'
    GROUP BY co.name, co.country_code, r.name
    ORDER BY SUM(t.amount) DESC
    LIMIT p_limit;
END;
$$;