USE ROLE useradmin;

CREATE ROLE job_ads_reporter_role;

USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_reporter_role;

GRANT USAGE ON DATABASE job_ads to job_ads_reporter_role;

GRANT USAGE ON SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON ALL TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;

GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_reporter_role;


GRANT ROLE job_ads_reporter_role TO USER reporter;

GRANT ROLE job_ads_reporter_role TO USER jassef;

USE ROLE job_ads_reporter_role;

SHOW GRANTS TO ROLE job_ads_reporter_role;

USE WAREHOUSE DEV_WH;

SELECT * FROM job_ads.marts.mart_job_listings;