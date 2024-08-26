USE DATABASE crunchbase_basic_company_data;

SHOW SCHEMAS;

USE SCHEMA PUBLIC;

SHOW TABLES;

SHOW VIEWS;

SELECT * FROM ORGANIZATION_SUMMARY LIMIT 10;

DESC VIEW ORGANIZATION_Summary;

SELECT COUNT(*) AS number_rows FROM ORGANIZATION_SUMMARY;

SELECT DISTINCT type FROM ORGANIZATION_SUMMARY;

SELECT COUNT(DISTINCT name) as number_unique_names from ORGANIZATION_SUMMARY;

SELECT COUNT(DISTINCT COUNTRY_CODE) FROM ORGANIZATION_SUMMARY;

SELECT COUNTRY_CODE, COUNT(*) AS number_organisations
FROM ORGANIZATION_SUMMARY
GROUP BY COUNTRY_CODE
ORDER BY number_organisations DESC;

SELECT COUNTRY_CODE, COUNT(*) AS number_organisations
FROM ORGANIZATION_SUMMARY
GROUP BY COUNTRY_CODE
HAVING COUNTRY_CODE IN ('SWE', 'NOR', 'DKK', 'FIN', 'ISL')
ORDER BY number_organisations DESC;


SELECT 
COUNTRY_CODE, 
region,
COUNT(*) AS number_organisations
FROM ORGANIZATION_SUMMARY
GROUP BY COUNTRY_CODE, region
HAVING COUNTRY_CODE IN ('SWE', 'NOR', 'DKK', 'FIN', 'ISL')
ORDER BY number_organisations DESC;

SELECT DISTINCT(ROLES), COUNT(*) AS Number_in_role
FROM ORGANIZATION_SUMMARY
GROUP BY ROLES
ORDER BY Number_in_role DESC;
