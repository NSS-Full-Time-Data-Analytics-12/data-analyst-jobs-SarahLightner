--How many rows are in the data_analyst_jobs table?
SELECT COUNT(title)
FROM data_analyst_jobs;
--1793

--Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--Exxonmobile

--How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'KY';
--21 TN 6 KY

--How many postings in Tennessee have a star rating above 4?
SELECT star_rating, location
FROM data_analyst_jobs
WHERE star_rating > 4 AND location = 'TN';
--3

--How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count > 500 AND review_count < 1000;
--150

--Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state,AVG(star_rating)AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating;
--NE

--Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--881

--How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
--230

--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG(star_rating), review_count
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count
ORDER BY avg;
--46
--Microsoft, 4.1

--Find all the job titles that contain the word â€˜Analystâ€™. How many different job titles are thereSELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--774

--How many different job titles do not contain either the word â€˜Analystâ€™ or the word â€˜Analyticsâ€™? What word do these positions have in common?SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'AND title NOT ILIKE '%Analytics%';
--4 and Tableau

--BONUS--
SELECT skill, days_since_posting, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'AND days_since_posting > 21 AND domain IS NOT NULL
ORDER BY days_since_posting DESC;
--Consulting and Business Services, 
--Restaurants, Travel and Leisure, 
--Banks and financial Services
--403

