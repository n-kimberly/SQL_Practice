SELECT * FROM movies;

-- Pull particular columns of interest
SELECT name, genre, year FROM movies;

-- Pull a column and assign different name
SELECT  imdb_rating AS 'IMDb' FROM movies;

-- Filter out only distinct elements of a column
SELECT DISTINCT genre FROM movies;

-- Querying with WHERE
SELECT * FROM movies WHERE imdb_rating > 8;
SELECT * FROM movies WHERE year > 2014;

-- Querying with LIKE
-- '_' is wildcard character, matching exactly one
SELECT * FROM movies WHERE name LIKE 'Se_en';
-- '%' is wildcard character, matching zero or more
SELECT * FROM movies WHERE name LIKE '%man%';
SELECT * FROM movies WHERE name LIKE 'The %';

-- NULL
-- IS NULL / IS NOT NULL
SELECT * FROM movies WHERE imdb_rating IS NOT NULL;
SELECT name FROM movies WHERE imdb_rating IS NULL;

-- BETWEEN
-- between 2 LETTERS IS not INCLUSIVE of 2nd letter
SELECT * FROM movies WHERE name BETWEEN 'A' AND 'J';
-- between 2 LETTERS IS INCLUSIVE of 2nd number
SELECT * FROM movies WHERE year BETWEEN 1990 AND 1999;
-- querying between D-F
SELECT * FROM movies WHERE name BETWEEN 'D' AND 'G';
-- released in 1970s
SELECT * FROM movies WHERE year BETWEEN 1970 AND 1979;

-- AND another query!
SELECT * FROM movies WHERE year BETWEEN 1970 AND 1979 AND imdb_rating > 8;
SELECT * FROM movies WHERE year < 1985 AND genre = 'horror';

-- OR this...
SELECT * FROM movies WHERE genre = 'romance' OR genre = 'comedy';

-- Order By, i.e. sort! (option: DESC)
SELECT name, year, imdb_rating FROM movies ORDER BY imdb_rating DESC;

-- LIMIT results, i.e. preview
SELECT * FROM movies LIMIT 10;
-- Top 3 movies
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 3;

-- IF/THEN SWITCH
SELECT name, 
    CASE
        WHEN imdb_rating > 8 THEN 'Fantastic'
        WHEN imdb_rating > 6 THEN 'Poorly Recieved'
        ELSE 'Avoid at All Costs'
    END
FROM movies;