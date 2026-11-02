/*
Exercise 07 - Literal c
Total farmers vs farmers with email in municipality 54518
*/
SELECT
    COUNT(*) AS total_farmers,
    COUNT(T1.email) AS farmers_with_email
FROM farm.farmers AS T1
WHERE T1.municipality_code = '54518';

/*
total_farmers | farmers_with_email
--------------+-------------------
230           | 165               
(1 row)
*/