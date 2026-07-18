

SELECT  
    job_id,
    job_title,
    name as company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

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
limit 10;
