# 🎬 Netflix Movie Ratings Analysis

This project explores a dataset of Netflix movies using SQL to uncover genre trends, rating patterns, and release insights. It demonstrates use of advanced SQL techniques such as subqueries, CTEs, window functions, and aggregation logic.

## 📂 Dataset

- **File**: `netflix_movies.csv`
- **Size**: 100 sample movies
- **Columns**:
  - `title`: Name of the movie
  - `genre`: Movie genre
  - `rating`: IMDb-like rating
  - `release_year`: Year of release

## 🎯 Project Goals

- Identify top genres and their average ratings
- Rank movies within genres by rating
- Track number of movie releases by year
- Create rating buckets using CASE logic
- Highlight genres performing above average

## 🧠 Advanced SQL Techniques Used

- Subqueries to compare averages
- Window functions (`RANK()`, `SUM() OVER`) for cumulative and ranked analysis
- CTEs (Common Table Expressions) for reusable logic
- CASE statements to group rating ranges
- Correlated subqueries to isolate top performers

## 📁 Files

| File | Description |
|------|-------------|
| `netflix_movies.csv` | Sample dataset |
| `netflix_analysis.sql` | SQL queries for the analysis |
| `README.md` | This project documentation |

## 💡 Insights

- Drama and Thriller were the most frequent genres
- Documentary had the highest average rating
- Movie releases increased between 2015–2021, then leveled off
- Less than 15% of movies were rated above 8.5

## 👨‍💻 Author

Created by [Eisa Ashraf](https://www.linkedin.com/in/eisaashraf/)

