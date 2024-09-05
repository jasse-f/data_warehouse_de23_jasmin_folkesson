Use the correct role and do the following

Note

Correct role refers to the system defined role and custom role that is most suitable for the 
task, i.e. do not use a top-level role such as ACCOUNTADMIN to do everything. 
Follow the principle of least privilege (PoLP) - only provide necessary access for roles to perform their duties.

  a) Create a marketing virtual warehouse called marketing_wh with size xs, 1 min suspend time, 
  it should autoresume, suspend initially and give it a suitable comment.;

USE ROLE SECURITYADMIN;
USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS marketing_wh WITH
WAREHOUSE_SIZE = "XSMALL"
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = "This a warehouse for exercise 1.";

  b) Now create a database called ifood, and add a staging layer by 
  creating a schema called staging.;

USE WAREHOUSE marketing_wh;
CREATE DATABASE IF NOT EXISTS ifood;

USE ifood;

CREATE SCHEMA staging;

  c) Create a user called extract_loader and setup its credentials.;

USE ROLE SECURITYADMIN;
USE ROLE USERADMIN;


  d) Create a role marketing_dlt_role and grant it access to staging.;

CREATE ROLE marketing_dlt_role;

GRANT USAGE ON WAREHOUSE MARKETING_WH TO ROLE marketing_dlt_role;
GRANT USAGE ON DATABASE ifood to ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT SELECT ON ALL TABLES IN SCHEMA my_database.staging TO ROLE marketing_dlt_role;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;


  e) Assign marketing_dlt_role to extract_loader user.;

  GRANT ROLE marketing_dlt_role to USER extract_loader;

  GRANT ROLE marketing_dlt_role to USER jassef;








