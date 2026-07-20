
/*
Question: What are the skills that are required for the top-paying data analyst jobs?
*/

with top_skills as (
    SELECT  
        job_id,
        job_title,
        name as company_name,
        salary_year_avg

    FROM
        job_postings_fact as jp

    left JOIN company_dim as cd
    on cd.company_id = jp.company_id
    WHERE
        job_location = 'Anywhere' and
        salary_year_avg is not NULL and
        job_title_short ='Data Analyst'
    order BY    
        salary_year_avg desc
    limit 10
)

SELECT
    ts.job_id,
    job_title,
    company_name,
    salary_year_avg,
    skills
FROM
    top_skills as ts

inner JOIN skills_job_dim as sjd
on sjd.job_id = ts.job_id
left JOIN skills_dim as sd 
ON sd.skill_id = sd.skill_id

order BY
    salary_year_avg desc