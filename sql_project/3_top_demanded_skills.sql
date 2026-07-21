/*
Question: What are the most in-demand skills for the roles?
*/


SELECT
    skills,
    count(jf.job_id) as no_total
FROM
   job_postings_fact as jf

inner JOIN skills_job_dim as sjd
on sjd.job_id = jf.job_id
inner JOIN skills_dim as sd 
ON sd.skill_id = sd.skill_id

group by
skills

limit 5;