
-- 1. How many distinct (different) actors' last names are there?
USE sakila;
SELECT COUNT(DISTINCT last_name) AS distinct_last_name
FROM sakila.actor;

-- 2. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
       CASE 
       WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'Weekend' 
       ELSE 'Weekday' END AS day_type
FROM sakila.rental;

-- 3. Get all films with ARMAGEDDON in the title.
SELECT title 
FROM film 
WHERE title LIKE ('%ARMAGEDDON%');

-- # 4. Get 10 the longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- # 5. How many films include Behind the Scenes content?
SELECT COUNT(*) AS bts_content
FROM film 
WHERE special_features LIKE '%%Behind the Scenes%%';

-- # 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * FROM film;
SELECT rating, ROUND(AVG(length),2) AS avg_per_rating
FROM film 
GROUP BY rating HAVING AVG(length) > 120 ;


-- # 7.  Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
SELECT title, length,
CASE
WHEN length BETWEEN 1 AND 60 THEN 'Short'
WHEN length BETWEEN 61 AND 120 THEN 'Medium'
ELSE 'Long'
END AS the_rank
FROM film
WHERE length IS NOT NULL AND length != 0
ORDER BY length DESC;
  -- or 
SELECT title, length, DENSE_RANK () OVER (ORDER BY length DESC) AS the_rank 
FROM film
WHERE length !=0 AND length IS NOT NULL;




