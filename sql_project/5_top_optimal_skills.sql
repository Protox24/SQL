/*
Question: What are the top optimal skills?
*/

with top_optimal_skills as (
    SELECT
        sd.skill_id,
        skills,
        ROUND(avg (salary_year_avg), 2) as avg_salary
    FROM
    job_postings_fact as jf

    inner JOIN skills_job_dim as sjd
    on sjd.job_id = jf.job_id
    inner JOIN skills_dim as sd 
    ON sjd.skill_id = sd.skill_id

    where
        job_title = 'Data Analyst' and
        salary_year_avg is not null
    group BY    
        sd.skill_id
),
top_in_demand_skills as (
    SELECT
        sd.skill_id,
        COUNT (sjd.job_id) as no_total
    FROM
    job_postings_fact as jf

    inner JOIN skills_job_dim as sjd
    on sjd.job_id = jf.job_id
   inner JOIN skills_dim as sd 
    ON sjd.skill_id = sd.skill_id

    where
        job_title = 'Data Analyst' and
        salary_year_avg is not null
    group BY    
        sd.skill_id
)

select
    tos.skill_id,
    skills,
    no_total,
    avg_salary
from
    top_optimal_skills as tos
inner join top_in_demand_skills as ts
on tos.skill_id = ts.skill_id
where
    no_total > 100
order BY
    avg_salary desc,
    no_total desc
limit 10
