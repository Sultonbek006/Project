SELECT  
      job_title_short,
      salary_year_avg,
      job_country,
      CASE 
            WHEN salary_year_avg > 200000 THEN 'HIGH'
            WHEN salary_year_avg BETWEEN 100000 AND 200000 THEN 'STANDARD'
            ELSE 'LOW'
                  END AS salary_range
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL 
AND  job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
Limit 400;
