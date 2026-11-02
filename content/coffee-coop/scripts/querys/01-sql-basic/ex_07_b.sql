-- Exercise 07 - b
-- Farms: altitude BETWEEN 1600 and 1800 masl in Pamplona
SELECT 
    T1.farm_name AS farm, 
    T1.rural_district AS rural_district, 
    T1.total_area_ha AS area_ha, 
    T1.altitude_masl AS altitude_masl
FROM farm.farms AS T1
WHERE T1.municipality_code = '54518' 
  AND T1.altitude_masl BETWEEN 1600 AND 1800
ORDER BY T1.rural_district ASC, T1.total_area_ha DESC;

/*
farm         | rural_district     | area_ha | altitude_masl
-------------+--------------------+---------+--------------
Los Pinos    | Alcaparral         | 1.67    | 1771         
Miraflores   | Alcaparral         | 1.29    | 1636         
Monteverde   | Alto Grande        | 2.59    | 1794         
La Loma      | Alto Grande        | 2.09    | 1667         
Bellavista   | Alto Grande        | 1.80    | 1704         
El Refugio   | Alto Grande        | 1.23    | 1661         
El Jardín    | Cabecera Municipal | 3.26    | 1620         
El Edén      | Cabecera Municipal | 2.89    | 1603         
La Milagrosa | Cabecera Municipal | 2.65    | 1643         
La Divisa    | Cabecera Municipal | 1.32    | 1765         
(10 rows)
*/