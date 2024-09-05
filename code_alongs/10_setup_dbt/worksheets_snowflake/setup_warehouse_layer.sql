USE ROLE SYSADMIN;

USE DATABASE job_ads;

CREATE SCHEMA IF NOT EXISTS warehouse;

SHOW SCHEMAS IN DATABASE job_ads;

USE ROLE SECURITYADMIN;

GRANT ROLE job_ads_dlt_role TO ROLE job_ads_dbt_role;

SHOW GRANTS TO ROLE job_ads_dbt_role;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

USE ROLE job_ads_dbt_role;

USE WAREHOUSE dev_wh;

SELECT * FROM job_ads.staging.data_field_job_ads LIMIT 10;

SHOW GRANTS ON SCHEMA job_ads.warehouse;

USE SCHEMA job_ads.warehouse;


CREATE TABLE test (id integer);

SHOW TABLES;

DROP TABLE TEST;
