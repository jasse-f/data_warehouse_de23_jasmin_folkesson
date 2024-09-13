with fct_job_ads AS (
    SELECT * FROM {{ ref('fct_job_ads') }}
),

job_details AS (SELECT * FROM {{ ref('dim_job_details') }}),
employer AS (SELECT * FROM {{ ref('dim_employer') }})
SELECT
jd.headline,
f.vacancies,
jd.salary_type,
f.relevance,
e.employer_name,
e.workplace_city,
jd.description_html_formatted
FROM fct_job_ads AS f
LEFT JOIN job_details AS jd
    ON f.job_details_key = jd.job_details_id
LEFT JOIN employer as e 
    ON f.employer_key = e.employer_id