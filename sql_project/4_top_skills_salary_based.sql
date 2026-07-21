
/*
Question: What are the top skills based on job´s salaries?
*/

SELECT
    skills,
    ROUND(avg (salary_year_avg), 2) as avg_salary
FROM
   job_postings_fact as jf

inner JOIN skills_job_dim as sjd
on sjd.job_id = jf.job_id
left JOIN skills_dim as sd 
ON sjd.skill_id = sd.skill_id

where
    job_title = 'Data Analyst' and
    salary_year_avg is not null
group BY    
    skills
order BY
    avg_salary desc
limit 25

--ROUND (QUE, CUANTOS DECIMALES DESPUES DEL PUNTO)

--RESULTS
/*
[
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "redis",
    "avg_salary": "128500.00"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "118000.00"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "115000.00"
  },
  {
    "skills": "pytorch",
    "avg_salary": "112500.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "112500.00"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "111175.00"
  },
  {
    "skills": "npm",
    "avg_salary": "111175.00"
  },
  {
    "skills": "unify",
    "avg_salary": "111175.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "108882.81"
  },
  {
    "skills": "jupyter",
    "avg_salary": "105605.56"
  },
  {
    "skills": "mongo",
    "avg_salary": "104625.00"
  },
  {
    "skills": "kafka",
    "avg_salary": "104529.17"
  },
  {
    "skills": "airflow",
    "avg_salary": "104342.11"
  },
  {
    "skills": "ssis",
    "avg_salary": "104322.27"
  },
  {
    "skills": "ibm cloud",
    "avg_salary": "104083.33"
  },
  {
    "skills": "qlik",
    "avg_salary": "102120.45"
  },
  {
    "skills": "cassandra",
    "avg_salary": "101250.00"
  },
  {
    "skills": "nosql",
    "avg_salary": "100750.31"
  },
  {
    "skills": "chef",
    "avg_salary": "100500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "100250.00"
  },
  {
    "skills": "keras",
    "avg_salary": "100000.00"
  },
  {
    "skills": "puppet",
    "avg_salary": "100000.00"
  },
  {
    "skills": "chainer",
    "avg_salary": "100000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "100000.00"
  }
]
*/