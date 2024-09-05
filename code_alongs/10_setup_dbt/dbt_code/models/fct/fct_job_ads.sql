WITH ja as (SELECT * FROM {{ ref('src_job_ads') }}),

jd as (SELECT * FROM {{ ref('src_job_details') }}),

e as (SELECT * FROM {{ ref('src_employer') }})

SELECT 
    {{ dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline']) }} as job_details_key,
    {{ dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name']) }} as employer_key,
    relevance,
    vacancies,
    application_deadline
from 
    ja
LEFT JOIN 
    jd on ja.id = jd.id
LEFT JOIN 
    e ON ja.id = e.id
    