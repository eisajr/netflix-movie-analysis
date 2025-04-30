-- Total number of movies per genre with average ratings
SELECT genre, COUNT(*) AS movie_count, ROUND(AVG(rating), 2) AS avg_rating
FROM netflix_movies
GROUP BY genre;

-- 1. Subquery: Genres with above-average rating
SELECT genre, ROUND(AVG(rating), 2) AS avg_genre_rating
FROM netflix_movies
GROUP BY genre
HAVING AVG(rating) > (
    SELECT AVG(rating) FROM netflix_movies
);

-- 2. Window Function: Rank movies within each genre by rating
SELECT 
    title,
    genre,
    rating,
    RANK() OVER (PARTITION BY genre ORDER BY rating DESC) AS genre_rank
FROM netflix_movies
ORDER BY genre, genre_rank;

-- 3. CTE + CASE: Rating distribution buckets
WITH rating_bins AS (
  SELECT
    CASE
      WHEN rating >= 9 THEN '9.0+'
      WHEN rating >= 8 THEN '8.0 - 8.9'
      WHEN rating >= 7 THEN '7.0 - 7.9'
      WHEN rating >= 6 THEN '6.0 - 6.9'
      ELSE '<6.0'
    END AS rating_group
  FROM netflix_movies
)
SELECT rating_group, COUNT(*) AS movie_count
FROM rating_bins
GROUP BY rating_group
ORDER BY rating_group;

-- 4. Window Function: Cumulative movie releases over time
SELECT
  release_year,
  COUNT(*) AS movies_this_year,
  SUM(COUNT(*)) OVER (ORDER BY release_year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_total
FROM netflix_movies
GROUP BY release_year
ORDER BY release_year;

-- 5. Correlated Subquery: Movies that are top-rated in their genre
SELECT title, genre, rating
FROM netflix_movies AS m
WHERE rating = (
  SELECT MAX(rating)
  FROM netflix_movies
  WHERE genre = m.genre
);
