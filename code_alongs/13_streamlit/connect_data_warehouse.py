import os
from dotenv import load_dotenv
from snowflake.connector import connect
import pandas as pd
import streamlit as st



def query_job_listings(query = 'SELECT * FROM mart_job_listings'):
    if hasattr(st, 'secrets') and "SNOWFLAKE_USER" in st.secrets:
        snowflake_user = st.secrets["SNOWFLAKE_USER"]
        snowflake_password = st.secrets["SNOWFLAKE_PASSWORD"]
        snowflake_account = st.secrets["SNOWFLAKE_ACCOUNT"]
        snowflake_warehouse = st.secrets["SNOWFLAKE_WAREHOUSE"]
        snowflake_database = st.secrets["SNOWFLAKE_DATABASE"]
        snowflake_schema = st.secrets["SNOWFLAKE_SCHEMA"]
        snowflake_role= st.secrets["SNOWFLAKE_ROLE"]

    else:
        load_dotenv()
        snowflake_user = os.getenv("SNOWFLAKE_USER")
        snowflake_password = os.getenv("SNOWFLAKE_PASSWORD")
        snowflake_account = os.getenv("SNOWFLAKE_ACCOUNT")
        snowflake_warehouse = os.getenv("SNOWFLAKE_WAREHOUSE")
        snowflake_database = os.getenv("SNOWFLAKE_DATABASE")
        snowflake_schema = os.getenv("SNOWFLAKE_SCHEMA")
        snowflake_role = os.getenv("SNOWFLAKE_ROLE")

    if not all([snowflake_user, snowflake_password, snowflake_account, snowflake_warehouse, snowflake_database, snowflake_schema, snowflake_role]):
        raise ValueError("Missing one or more Snowflake credentials")

    with connect(
        user=snowflake_user,
        password=snowflake_password,
        account=snowflake_account,
        warehouse=snowflake_warehouse,
        database=snowflake_database,
        schema=snowflake_schema,
        role=snowflake_role
    ) as conn:
        
        df = pd.read_sql(query, conn)
        return df
    
    