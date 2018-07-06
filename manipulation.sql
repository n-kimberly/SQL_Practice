/*
CREATE TABLE
INSERT INTO
SELECT
UPDATE
ALTER TABLE
DELETE FROM
*/

-- Create table of celebrities with name and age
CREATE TABLE celebs (
	id INTEGER PRIMARY KEY,
	name TEXT,
	age INTEGER
);

-- Add rows */
INSERT INTO celebs (name, age) VALUES ('Justin Bieber', 21);
INSERT INTO celebs (name, age) VALUES ('Beyonce Knowles', 33);
INSERT INTO celebs (name, age) VALUES ('Jeremy Lin', 26);
INSERT INTO celebs (name, age) VALUES ('Taylor Swift', 26);

-- Update biebers age
UPDATE celebs SET age = 22 WHERE id = 1;

-- Add coumn to schema
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;

-- Add tswift's twitter handle
UPDATE celebs SET twitter_handle = '@taylorswift13' WHERE name = 'Taylor Swift';

-- Delete all rows with null twitter handles
DELETE FROM celebs WHERE twitter_handle IS NULL;

-- Display table
SELECT * FROM celebs;

-- Create awards table with default parameter and not null constraint
CREATE TABLE awards (
    id INTEGER PRIMARY KEY, 
    recipient TEXT NOT NULL, 
    award_name TEXT DEFAULT "Grammy");

-- CREATE TABLE celebs (
--     id INTEGER PRIMARY KEY,
--     name TEXT UNIQUE,
--     date_of_birth TEXT NOT NULL,
--     date_of_death DEFAULT 'Not Applicable');