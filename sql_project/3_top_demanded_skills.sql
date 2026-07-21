/*
Question: What are the most in-demand skills for the roles?
*/


SELECT
    skills,
    COUNT (sjd.job_id) as no_total
FROM
   job_postings_fact as jf

inner JOIN skills_job_dim as sjd
on sjd.job_id = jf.job_id
left JOIN skills_dim as sd 
ON sjd.skill_id = sd.skill_id

where
    job_title = 'Data Analyst'
group BY    
    skills
order BY
    no_total desc
limit 10