/* Question: What skills are required for the top-paying data analyst jobs?

-Use the top 10 highest-paying Data Analyst jobs from first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills
-helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_jobs.*,
    skills 
FROM top_jobs
INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    top_jobs.salary_year_avg DESC;

/* 
Most In-Demand Skills:

The most frequently requested skills across these job postings are foundational data analysis tools.

SQL is the most required skill, appearing in 8 out of 10 job postings.

Python follows closely, appearing in 7 postings.

Tableau is the leading visualization tool, required in 6 postings.

Other notable mentions include R, Snowflake, Pandas, and Excel. 
*/

