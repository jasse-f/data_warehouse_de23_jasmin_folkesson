SHOW DATABASES;

USE WAREHOUSE COMPUTE_WH;

CREATE DATABASE IF NOT EXISTS demo_db;

USE DATABASE demo_db;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_db.staging;

SHOW SCHEMAS IN demo_db;

CREATE TABLE IF NOT EXISTS customer(
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

SHOW tables IN DEmo_DB.staging;

SELECT * FROM CUSTOMER;

INSERT INTO customer (customer_id, age, email)
VALUES
(1, 32, 'abc@gmail.com'),
(1, 23, 'dsa@gmail.com');

DROP DATABASE DEMO_DB;

SHOW DATABASES;