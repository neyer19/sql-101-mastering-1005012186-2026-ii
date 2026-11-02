/*
Exercise 03 - Literal c
Coffee varieties not planted in any plot using RIGHT JOIN
*/
SELECT
    T2.variety_name AS variety,
    T2.species AS species
FROM farm.plot_varieties AS T1
RIGHT JOIN farm.coffee_varieties AS T2
    ON T1.variety_id = T2.variety_id
WHERE T1.plot_id IS NULL;

/*
variety | species
--------+---------
(0 rows)
*/