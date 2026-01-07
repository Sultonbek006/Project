/* 
Question: what are the most in-demand skills for data analysts?

- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst. Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest and in the job market,
   providing insights into the most valuable skills for job seekers. 
*/


SELECT *
FROM job_postings_fact
LIMIT 20;

SELECT  
    skills_dim.skills,
    COUNT(skills_job_dim.skill_id) AS demand_count -- Use the bridge table's skill_id
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND job_location = 'Anywhere'
GROUP BY skills_dim.skills 
ORDER BY demand_count DESC
LIMIT 5;

/* SQL: The Gatekeeper (7,291 count)
SQL is the undisputed "king" with nearly 60% higher demand than the next skill (Excel).

Insight: SQL is not just a "bonus" skill; it is the fundamental language of data retrieval. In 2023, if you didn't know SQL, you were effectively locked out of the majority of data roles.

2026 Context: Even with AI agents like Manus AI, SQL remains critical because analysts must still "prompt" the agent or verify the logic of the code the AI generates.

2. The Excel vs. Python "Ceiling"
The gap between Excel (4,611) and Python (4,330) is very narrow.

Insight: This suggests a split in the market:

Excel represents "Business Analytics" (quick ad-hoc reporting and small-scale finance).

Python represents "Data Science Lite" (automation, cleaning large datasets, and reproducibility).

The Trend: Many job postings likely required both, seeing Excel as the tool for communication and Python as the tool for execution.

3. The Visualization Duel (Tableau vs. Power BI)
In 2023, Tableau (3,745) held a significant lead over Power BI (2,609) in your dataset.

Insight: Tableau was historically the "gold standard" for high-end, artistic data storytelling and enterprise-level dashboards.

2026 Evolution: Recent market data shows Power BI has rapidly closed this gap due to its deep integration with Microsoft 365 and lower pricing. If you were looking at 2026 data, you would likely see these two neck-and-neck or even swapped.
