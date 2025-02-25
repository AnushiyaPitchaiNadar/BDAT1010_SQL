/*
Final Group Project Part 1 - MS SQL
BDAT1010-24S-30691

Movie Database

Nicole Helf
Anushiya Pitchai Nadar
Fizaben Vahora

Due: July 17, 2024
*/

--Question 1: Create a database �Movies�.

--Switch to master Database
USE [master]
GO
--Check to see if the database exists and drop it if it does
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'Movies')
BEGIN
	-- Drop the database
	DROP DATABASE Movies;
END
GO

-- Create a database "Movies"
CREATE DATABASE Movies;
GO

--Switch to Movie Database
USE [Movies]
GO

--Question 2: Create a �mov� schema under �Movies�.
CREATE SCHEMA mov;
GO

--Question 3: Create a table call �Movie_Director �under mov schema.

--DROP tables prior to creating them to start from scratch
DROP TABLE IF EXISTS mov.Movie_Director;
DROP TABLE IF EXISTS mov.Movies;
DROP TABLE IF EXISTS mov.Movie_Actor;
DROP TABLE IF EXISTS mov.Movie_Rating;

--Create the Movie_Director table with constraints and specifications
CREATE TABLE mov.Movie_Director(
	Director_ID	int NOT NULL IDENTITY(100,10) Constraint PK_Director_ID PRIMARY KEY CLUSTERED,
	Director_First_Name varchar(50),
	Director_Last_Name varchar(50),
	Director_Age_in_Years int,
	Director_Gender varchar(10),
	CreatedOn date NOT NULL Constraint DF_CreatedOn DEFAULT GETDATE()
);
GO

--insert values into Movie_Director table. Did not add Director_ID or CreatedOn values as they are auto generated from constraints.
INSERT INTO mov.Movie_Director (Director_First_Name, Director_Last_Name, Director_Age_in_Years, Director_Gender)
VALUES 
    ('Kevin', 'Smith', 52, 'Male'),
    ('Miguel', 'Arteta', 41, 'Male'),
    ('Mark', 'Johnson', 58, 'Male'),
    ('Tom', 'Vaughan', 37, 'Male'),
    ('Francis', 'Lawrence', 52, 'Male'),
    ('Adrienne', 'Shelly', 40, 'Female'),
    ('David', 'Slade', 53, 'Male'),
    ('Mark', 'Palansky', 53, 'Male'),
    ('Jeff', 'Lowell', 49, 'Male'),
    ('Simon', 'Curtis', 37, 'Male'),
    ('Marc', 'Lawrence', 95, 'Male'),
    ('Anand', 'Tucker', 59, 'Male'),
    ('Judd', 'Apatow', 55, 'Male'),
    ('Cary', 'Fukunaga', 45, 'Male'),
    ('Mark', 'Helfrich', 49, 'Male'),
    ('Nanette', 'Burstein', 52, 'Female'),
    ('James', 'McAvoy', 44, 'Male'),
    ('Mark', 'Waters', 58, 'Male'),
    ('Seth', 'Gordon', 46, 'Male'),
    ('Alex', 'Kendrick', 52, 'Male'),
    ('Kevin', 'Lima', 60, 'Male'),
    ('Lasse', 'Hallstr�m', 76, 'Male'),
    ('Ewan', 'McGregor', 52, 'Male'),
    ('Rajkumar', 'Hirani', 60, 'Male'),
    ('Ashutosh', 'Gowariker', 59, 'Male'),
    ('Karan', 'Johar', 50, 'Male'),
    ('S.S', 'Rajamouli', 49, 'Male'),
    ('Sukumar', NULL, 53, 'Male'),
    ('Aditya', 'Chopra', 51, 'Male'),
    ('Umesh', 'Shukla', 52, 'Male');
GO

--Question 4: Create a Movies table under mov schema

--Create the Movies table with constraints and specifications
CREATE TABLE mov.Movies (
    Movie_ID int NOT NULL IDENTITY(1000,1) Constraint PK_Movie_ID PRIMARY KEY CLUSTERED,
    Movie_Name VARCHAR(255),
    Movie_Released_Year INT,
    Movie_Lead_Studio VARCHAR(255),
    Movie_Language VARCHAR(255),
    Movie_Category VARCHAR(255),
    Movie_Duration_in_Min INT,
    Movie_Worldwide_Earning_in_$M DECIMAL(15,2),
    Movie_Type VARCHAR(20) CONSTRAINT CK_Movie_Type CHECK (Movie_Type IN('Hollywood', 'Bollywood')),
    Director_ID INT CONSTRAINT FK_Director_ID FOREIGN KEY REFERENCES mov.Movie_Director(Director_ID),
    CreatedOn date NOT NULL Constraint DF_CreatedOn_Movies DEFAULT GETDATE()
);
GO

--insert values into Movie table. Did not add Movie_ID or CreatedOn values as they are auto generated from constraints.
INSERT INTO mov.Movies(
    Movie_Name,
    Movie_Released_Year,
    Movie_Lead_Studio,
    Movie_Language,
    Movie_Category,
    Movie_Duration_in_Min,
    Movie_Worldwide_Earning_in_$M,
    Movie_Type,
    Director_ID
)
VALUES
('Zack and Miri Make a Porno', 2008, 'The Weinstein Company', 'English', 'Romance', 101, 41.94, 'Hollywood', 100),
('Youth in Revolt', 2010, 'The Weinstein Company', 'English', 'Comedy', 90, 19.62, 'Hollywood', 110),
('When in Rome', 2010, 'Disney', 'English', 'Comedy', 91, 43.04, 'Hollywood', 120),
('What Happens in Vegas', 2008, 'Fox', 'English', 'Comedy', 99, 219.37, 'Hollywood', 130),
('Water For Elephants', 2011, '20th Century Fox', 'English', 'Drama', 120, 117.09, 'Hollywood', 140),
('Waitress', 2007, 'Independent', 'English', 'Romance', 108, 22.18, 'Hollywood', 150),
('Twilight', 2008, 'Summit', 'English', 'Romance', 122, 376.66, 'Hollywood', 160),
('Penelope', 2008, 'Summit', 'English', 'Comedy', 144, 20.74, 'Hollywood', 170),
('Over Her Dead Body', 2008, 'New Line', 'English', 'Comedy', 95, 20.71, 'Hollywood', 180),
('My Week with Marilyn', 2011, 'The Weinstein Company', 'English', 'Drama', 99, 8.26, 'Hollywood', 190),
('Music and Lyrics', 2007, 'Warner Bros.', 'English', 'Romance', 104, 145.9, 'Hollywood', 200),
('Leap Year', 2010, 'Universal', 'English', 'Comedy', 100, 32.59, 'Hollywood', 210),
('Knocked Up', 2007, 'Universal', 'English', 'Comedy', 129, 219, 'Hollywood', 220),
('Jane Eyre', 2011, 'Universal', 'English', 'Romance', 120, 30.15, 'Hollywood', 230),
('Good Luck Chuck', 2007, 'Lionsgate', 'English', 'Comedy', 101, 59.19, 'Hollywood', 240),
('Going the Distance', 2010, 'Warner Bros.', 'English', 'Comedy', 103, 42.05, 'Hollywood', 250),
('Gnomeo and Juliet', 2011, 'Disney', 'English', 'Animation', 84, 193.97, 'Hollywood', 260),
('Ghosts of Girlfriends Past', 2009, 'Warner Bros.', 'English', 'Comedy', 100, 102.22, 'Hollywood', 270),
('Four Christmases', 2008, 'Warner Bros.', 'English', 'Comedy', 88, 161.83, 'Hollywood', 280),
('Fireproof', 2008, 'Independent', 'English', 'Drama', 122, 33.47, 'Hollywood', 290),
('Enchanted', 2007, 'Disney', 'English', 'Comedy', 107, 340.49, 'Hollywood', 300),
('Dear John', 2010, 'Sony', 'English', 'Drama', 108, 114.97, 'Hollywood', 310),
('Beginners', 2011, 'Independent', 'English', 'Comedy', 105, 14.31, 'Hollywood', 320),
('3 Idiots', 2009, 'Vinod Chopra Films', 'Hindi', 'Comedy', 171, 4000, 'Bollywood', 330),
('Lagaan', 2001, 'Aamir Khan Productions', 'Hindi', 'Romance', 224, 659, 'Bollywood', 340),
('My Name Is Khan', 2010, 'Dharma Productions', 'Hindi', 'Drama', 165, 48.77, 'Bollywood', 350),
('Baahubali', 2015, 'Arka Media Works', 'Telugu', 'Thriller', 159, 6500, 'Bollywood', 360),
('Dilwale Dulhania Le Jayenge', 1995, 'Yash Chopra', 'Hindi', 'Romance', 189, 2000, 'Bollywood', 380),
('Oh My God', 2012, NULL, 'Hindi', 'Comedy', 165, 1200, 'Bollywood', 390),
('Pushpa', 2021, 'Mythri Movie Makers', 'Telugu', 'Drama', 179, 3730, 'Bollywood', 370);
GO

--Question 5: Create a Movie_Actor table under mov schema 

--Create the Movie_Actor table with constraints and specifications
CREATE TABLE mov.Movie_Actor (
    Actor_ID INT NOT NULL IDENTITY(10, 1) CONSTRAINT PK_Actor_ID PRIMARY KEY CLUSTERED,
    Actor_First_Name VARCHAR(50),
    Actor_Last_Name VARCHAR(50),
    Actor_Age_in_Years INT,
    Actor_Location VARCHAR(100),
    Movie_ID INT CONSTRAINT FK_Movie_ID FOREIGN KEY REFERENCES mov.Movies(Movie_ID),
    CreatedOn DATE CONSTRAINT DF_CreatedOn_Actor DEFAULT GETDATE() NOT NULL,
    );
GO

--insert values into Movie_Actor table. Did not add Actor_ID or CreatedOn values as they are auto generated from constraints.
INSERT INTO mov.Movie_Actor (Actor_First_Name, Actor_Last_Name, Actor_Age_in_Years, Actor_Location, Movie_ID)
VALUES
('Seth', 'Rogen', 53, 'Los Angeles', 1000),
('Michael', 'Cera', 49, 'New York', 1001),
('Josh', 'Duhamel', 37, 'North Dakota', 1002),
('Jason', 'Sudeikis', 60, 'Kansas', 1003),
('Robert', 'Pattinson', 45, 'Los Angeles', 1004),
('Nathan', 'Fillion', 55, 'Canada', 1005),
('Robert', 'Pattinson', 45, 'Los Angeles', 1006),
('James', 'McAvoy', 49, 'Scotland', 1007),
('Paul', 'Rudd', 52, 'New York', 1008),
('Kenneth', 'Branagh', 44, 'Northern Ireland', 1009),
('Hugh', 'Grant', 58, 'London', 1010),
('Matthew', 'Goode', 46, 'England', 1011),
('Judd', 'Apatow', 58, 'Los Angeles', 1012),
('Michael', 'Fassbender', 46, 'Germany', 1013),
('Dane', 'Cook', 52, 'United States', 1014),
('Jason', 'Sudeikis', 60, 'Kansas', 1015),
('Kelly', 'Asbury', 76, 'United States', 1016),
('Matthew', 'McConaughey', 52, 'Los Angeles', 1017),
('Vince', 'Vaughn', 60, 'Minnesota', 1018),
('Kirk', 'Cameron', 59, 'United States', 1019),
('James', 'Marsden', 50, 'Columbia', 1020),
('Channing', 'Tatum', 58, 'Alabama', 1021),
('Mike', 'Mills', 37, 'New York', 1022),
('Aamir', 'Khan', 52, 'India', 1023),
('Aamir', 'Khan', 52, 'India', 1024),
('Shah Rukh', 'Khan', 53, 'India', 1025),
('Prabhas', NULL, 53, 'India', 1026),
('Allu', 'Arjun', 49, 'India', 1027),
('Shah Rukh', 'Khan', 53, 'India', 1028),
('Akshay', 'Kumar', 50, 'India', 1029);
GO

--Question 6: Create a Movie_Rating table under mov schema 

--Create the Movie_Rating table with constraints and specifications
CREATE TABLE mov.Movie_Rating (
    Movie_Rating_ID INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Movie_Rating_ID PRIMARY KEY CLUSTERED,
    Rating_Audience_Score VARCHAR(50),
    Rating_Rotten_Tomatoes VARCHAR(50),
    Movie_ID INT CONSTRAINT FK_Movie_Rating_Movie_ID FOREIGN KEY (Movie_ID) REFERENCES mov.Movies(Movie_ID),
    CreatedOn DATE CONSTRAINT DF_CreatedOn_Rating DEFAULT GETDATE() NOT NULL,
);
GO

--Insert records into the Movie_Rating table. Did not add Movie_Rating_ID or CreatedOn values as they are auto generated from constraints.
INSERT INTO mov.Movie_Rating (Rating_Audience_Score, Rating_Rotten_Tomatoes, Movie_ID)
VALUES
('70', '64', 1000),
('52', '68', 1001),
('44', '15', 1002),
('72', '28', 1003),
('72', '60', 1004),
('67', '89', 1005),
('82', '49', 1006),
('74', '52', 1007),
('47', '15', 1008),
('84', '83', 1009),
('70', '63', 1010),
('49', '21', 1011),
('83', '91', 1012),
('77', '85', 1013),
('61', '3', 1014),
('56', '53', 1015),
('52', '56', 1016),
('47', '27', 1017),
('52', '26', 1018),
('51', '40', 1019),
('80', '93', 1020),
('66', '29', 1021),
('80', '84', 1022),
('95', '100', 1023),
('81', '95', 1024),
('79', '83', 1025),
('80', '90', 1026),
('76', '82', 1027),
('85', '100', 1028),
('81', '74', 1029);
GO

/*
table creation complete
Created 4 tables in total:
mov.Movie_Director;
mov.Movies;
mov.Movie_Actor;
mov.Movie_Rating;
*/

/* Queries
7 sets of queries
*/

/** 
Question 7	 
**/


--a. List all the Movies information from the Movies table:
BEGIN
    SELECT * FROM mov.Movies;
END
GO

--b. List all the Director information from the Director table:
BEGIN
    SELECT * FROM mov.Movie_Director;
END
GO

--c. List all the Actor information from the Actor table:
BEGIN
    SELECT * FROM mov.Movie_Actor;
END
GO

--d. List all the Rating information from the Rating table:
BEGIN
    SELECT * FROM mov.Movie_Rating;
END
GO

--e. List all the movies released in the year �2010�:
BEGIN
    SELECT Movie_Name, Movie_Released_Year 
    FROM mov.Movies 
    WHERE Movie_Released_Year = 2010;
END
GO

--f. List all the movies released by �The Weinstein Company� studio:
BEGIN
    SELECT Movie_Name,Movie_Lead_Studio
	FROM mov.Movies
	WHERE Movie_Lead_Studio = 'The Weinstein Company';
END
GO

--g. List all the movies released in �English�:
BEGIN
    SELECT Movie_Name,Movie_Language
	FROM mov.Movies
	WHERE Movie_Language = 'English';
END
GO

--h. List all the movies whose name starts with �G�:
BEGIN
    SELECT Movie_Name
	FROM mov.Movies
	WHERE Movie_Name LIKE 'G%';
END
Go

--i.Display all the movies under the �Comedy� category:
BEGIN
    SELECT Movie_Name,Movie_Category
	FROM mov.Movies
	WHERE Movie_Category = 'Comedy';
END
GO

--j. Display all the movies where movie type is �Hollywood�:
BEGIN
    SELECT Movie_Name,Movie_Type
	FROM mov.Movies 
	WHERE Movie_Type = 'Hollywood';
END
GO

--k. Display all the �Female� directors:
BEGIN
    SELECT * 
	FROM mov.Movie_Director 
	WHERE Director_Gender = 'Female';
END
GO

--l. Display all the directors whose Age is more than 45 years:
BEGIN
    SELECT Director_ID,Director_First_Name,Director_Last_Name,Director_Age_in_Years 
	FROM mov.Movie_Director 
	WHERE Director_Age_in_Years > 45;
END
GO

--m. Display all the Actors from �Los Angeles�:
BEGIN
    SELECT Actor_ID,Actor_First_Name,Actor_Last_Name,Actor_Location 
	FROM mov.Movie_Actor 
	WHERE Actor_Location = 'Los Angeles';
END
GO

--n. Display all the Actors whose Age is less than 50 years:
BEGIN
    SELECT Actor_ID,Actor_First_Name,Actor_Last_Name,Actor_Age_in_Years
	FROM mov.Movie_Actor 
	WHERE Actor_Age_in_Years < 50;
END
GO

--o.Display all the Actors whose name starts with �J�:
BEGIN
    SELECT Actor_First_Name 
	FROM mov.Movie_Actor 
	WHERE Actor_First_Name LIKE 'J%';
END
GO

--p. Display all the Actors who are from �Los Angeles� or �New York�:
BEGIN
    SELECT Actor_First_Name,Actor_Last_Name,Actor_Location 
	FROM mov.Movie_Actor 
	WHERE Actor_Location IN ('Los Angeles', 'New York');
END
GO


--q. List Director_FullName, Director_Age_in_Years, Director_Gender from Director:
BEGIN
    SELECT 
        Director_First_Name + ' ' + ISNULL(Director_Last_Name, '') AS Director_FullName, 
        Director_Age_in_Years, 
        Director_Gender 
    FROM 
        mov.Movie_Director;
END
GO

--r. List Director_FullName, Director_Age_in_Years, Director_Gender from Director whose Age is less than 45 years:
BEGIN
    SELECT 
        Director_First_Name + ' ' + ISNULL(Director_Last_Name, '') AS Director_FullName, 
        Director_Age_in_Years, 
        Director_Gender 
    FROM 
        mov.Movie_Director
    WHERE 
        Director_Age_in_Years < 45;
END
GO

-- Question 8: Write the following Query based on the above datasets
-- a. Display all the Movies and their Actors information based on the relationship
SELECT m.Movie_Name, a.Actor_First_Name, a.Actor_Last_Name
FROM mov.Movies m
JOIN mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID;
  
-- b. Display the Movies name and their Ratings
SELECT m.Movie_Name, r.Rating_Audience_Score, r.Rating_Rotten_Tomatoes
FROM mov.Movies m
JOIN mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID;
 
-- c. Display all the Movies, Actors, and Directors information based on the relationship
SELECT 
    m.Movie_Name, 
    a.Actor_First_Name, a.Actor_Last_Name,
    d.Director_First_Name, d.Director_Last_Name
FROM mov.Movies m
JOIN mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN mov.Movie_Director d ON m.Director_ID = d.Director_ID;
 
-- d. Display all the Movies, Actors, Directors, and Movie Rating information based on the relationship
SELECT 
    m.Movie_Name, 
    a.Actor_First_Name, a.Actor_Last_Name,
    d.Director_First_Name, d.Director_Last_Name,
    r.Rating_Audience_Score, r.Rating_Rotten_Tomatoes
FROM mov.Movies m
JOIN mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN mov.Movie_Director d ON m.Director_ID = d.Director_ID
JOIN mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID;
 
-- e. Display all the Movies, Actors, Directors, and Movie Rating information
--	  whose Rating_Audience_Score is more than 80% based on the relationship
SELECT 
    m.Movie_Name, 
    a.Actor_First_Name, a.Actor_Last_Name,
    d.Director_First_Name, d.Director_Last_Name,
    r.Rating_Audience_Score, r.Rating_Rotten_Tomatoes
FROM mov.Movies m
JOIN mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN mov.Movie_Director d ON m.Director_ID = d.Director_ID
JOIN mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
WHERE r.Rating_Audience_Score > 80;
 
-- f. Display all the Movies information whose Rating_Rotten_Tomatoes is more than 90%
SELECT 
    m.*
FROM mov.Movies m
JOIN mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
WHERE r.Rating_Rotten_Tomatoes > 90;

/** 

Question 9

**/

--a. Create a new table MovieCopy and copy all records of Movie table
BEGIN
    SELECT *
    INTO mov.MovieCopy
    FROM mov.Movies;
END
GO

--b. Create a new table DirectorCopy and copy only the schema of the director table
BEGIN
    SELECT TOP 0 *
    INTO mov.DirectorCopy
    FROM mov.Movie_Director;
END
GO

--c. Create a new table ActorCopy and copy all records of Actor table
BEGIN
    SELECT *
    INTO mov.ActorCopy
    FROM mov.Movie_Actor;
END
GO

--d. Create a new table RatingCopy and copy all records of Rating table
BEGIN
    SELECT *
    INTO mov.RatingCopy
    FROM mov.Movie_Rating;
END
GO

--e. Create a new table RatingCopies and copy only the schema from Rating table
BEGIN
    SELECT TOP 0 *
    INTO mov.RatingCopies
    FROM mov.Movie_Rating;
END
GO

/**

Question 10 -- Deleting records

**/

--a. Delete all the records from the RatingCopy table
BEGIN
    DELETE FROM mov.RatingCopy;
END
GO

--b. Delete all the movies from MovieCopy whose released in year �2010�
BEGIN
    DELETE FROM mov.MovieCopy
    WHERE Movie_Released_Year = 2010;
END
GO

--c. Delete all the movies from MovieCopy where language is 'Hindi'
BEGIN
    DELETE FROM mov.MovieCopy
    WHERE Movie_Language = 'Hindi';
END
GO

--d. Delete all the movies from MovieCopy where Rating_Audience_Score is less than 80%
BEGIN
    DELETE mc
    FROM mov.MovieCopy mc
    JOIN mov.Movie_Rating mr ON mc.Movie_ID = mr.Movie_ID
    WHERE CAST(mr.Rating_Audience_Score AS INT) < 80;
END
GO

--e. Delete all the movies from MovieCopy where Rating_Rotten_Tomatoes is less than 70%
BEGIN
    DELETE mc
    FROM mov.MovieCopy mc
    JOIN mov.Movie_Rating mr ON mc.Movie_ID = mr.Movie_ID
    WHERE CAST(mr.Rating_Rotten_Tomatoes AS INT) < 70;
END
GO

-- Question 11: Write the following Query based on the above datasets
-- a. Update the Rating_Audience_Score by 85% for the movie released by �The Weinstein Company� studio
UPDATE r
SET r.Rating_Audience_Score = '85'
FROM mov.Movie_Rating r
JOIN mov.Movies m ON r.Movie_ID = m.Movie_ID
WHERE m.Movie_Lead_Studio = 'The Weinstein Company';

-- b. Update the Rating_Rotten_Tomatoes by 75% for the movie released in Year 2010
UPDATE r
SET r.Rating_Rotten_Tomatoes = '75'
FROM mov.Movie_Rating r
JOIN mov.Movies m ON r.Movie_ID = m.Movie_ID
WHERE m.Movie_Released_Year = 2010;
 
-- c. Increase the Actor Age by 2 years whose Name is �Michael Cera�
UPDATE mov.Movie_Actor
SET Actor_Age_in_Years = Actor_Age_in_Years + 2
WHERE Actor_First_Name = 'Michael' AND Actor_Last_Name = 'Cera';

-- d. Increase the Director Age by 3 years who has directed the movie �Leap Year�.
UPDATE mov.Movie_Director
SET Director_Age_in_Years = Director_Age_in_Years + 3
FROM mov.Movie_Director d
JOIN mov.Movies m ON d.Director_ID = m.Director_ID
WHERE m.Movie_Name = 'Leap Year';
GO
 
-- e. Increase the Director and Actor Age by 1 year who has directed the movie �Leap Year�
-- Update Director Age
UPDATE d
SET d.Director_Age_in_Years = d.Director_Age_in_Years + 1
FROM mov.Movie_Director d
JOIN mov.Movies m ON d.Director_ID = m.Director_ID
WHERE m.Movie_Name = 'Leap Year';
 
-- Update Actor Age
UPDATE a
SET a.Actor_Age_in_Years = a.Actor_Age_in_Years + 1
FROM mov.Movie_Actor a
JOIN mov.Movies m ON a.Movie_ID = m.Movie_ID
WHERE m.Movie_Name = 'Leap Year';
 
 
-- Question 12: Write the following Query based on the above datasets
-- a. Create a view to display all the movie information
CREATE VIEW mov.v_AllMovies AS
SELECT 
    Movie_ID, 
    Movie_Name, 
    Movie_Released_Year, 
    Movie_Lead_Studio, 
    Movie_Language, 
    Movie_Category, 
    Movie_Duration_in_Min, 
    Movie_Worldwide_Earning_in_$M, 
    Movie_Type, 
    Director_ID, 
    CreatedOn
FROM 
    mov.Movies;
GO
 
-- b. Create a view to display all the movies and their rating information
CREATE VIEW mov.v_MoviesAndRatings AS
SELECT 
    m.Movie_ID, 
    m.Movie_Name, 
    r.Rating_Audience_Score, 
    r.Rating_Rotten_Tomatoes
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID;
GO
 
-- c. Create a view to display all the movies and their actor information
CREATE VIEW mov.v_MoviesAndActors AS
SELECT 
    m.Movie_ID, 
    m.Movie_Name, 
    a.Actor_ID, 
    a.Actor_First_Name, 
    a.Actor_Last_Name, 
    a.Actor_Age_in_Years, 
    a.Actor_Location
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID;
GO
 
-- d. Create a view to display all the movies, rating, actor along with director information
CREATE VIEW mov.v_MoviesRatingsActorsDirectors AS
SELECT 
    m.Movie_ID, 
    m.Movie_Name, 
    r.Rating_Audience_Score, 
    r.Rating_Rotten_Tomatoes, 
    a.Actor_ID, 
    a.Actor_First_Name, 
    a.Actor_Last_Name, 
    a.Actor_Age_in_Years, 
    a.Actor_Location, 
    d.Director_ID, 
    d.Director_First_Name, 
    d.Director_Last_Name, 
    d.Director_Age_in_Years, 
    d.Director_Gender
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN 
    mov.Movie_Director d ON m.Director_ID = d.Director_ID;
GO
 
-- e. Create a view to display all the information based on the result set returned by the query
-- List movie, Director_FullName, Director_Age_in_Years, Director_Gender from Director
-- [Director_FullName =Director_First_Name +"" + Director_Last_Name]
CREATE VIEW mov.v_MoviesDirectorsFullName AS
SELECT 
    m.Movie_ID, 
    m.Movie_Name, 
    CONCAT(d.Director_First_Name, ' ', d.Director_Last_Name) AS Director_FullName, 
    d.Director_Age_in_Years, 
    d.Director_Gender
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Director d ON m.Director_ID = d.Director_ID;
GO

--Question 13: Write the following Query based on the above datasets.

--a. Retrieve the list of all Databases.
SELECT name
FROM sys.databases
WHERE state_desc = 'ONLINE';
GO

-- b. Display the byte size of all tables in databases. (Anushiya, please double check this)
USE [Movies] --switch to Movie database
GO

SELECT 
    OBJECT_SCHEMA_NAME(object_id) AS SchemaName, -- use function to return schema name for all object_id's
    OBJECT_NAME(object_id) AS TableName, -- use function to return table name for all object_id's
    SUM(used_page_count) * 8 * 1024 AS TotalBytes -- this calculates the bytes
FROM 
    sys.dm_db_partition_stats
WHERE
	OBJECT_SCHEMA_NAME(object_id) = 'mov' --filter on mov schema
GROUP BY 
    OBJECT_SCHEMA_NAME(object_id), 
    OBJECT_NAME(object_id)
ORDER BY 
    SchemaName, TableName;
GO

--c.List of tables with number of records.
SELECT 
    OBJECT_SCHEMA_NAME(object_id) AS SchemaName, --uses the OBJECT_SCHEMA_NAME() function to return the schema name for the object_id
    OBJECT_NAME(object_id) AS TableName, --uses the OBJECT_NAME() function to return the table name for the object_id
    SUM(rows) AS 'RowCount' --total the values in the row column to sum the total rows
FROM 
    sys.partitions
WHERE
	OBJECT_SCHEMA_NAME(object_id) = 'mov'
GROUP BY 
    object_id
ORDER BY 
    SchemaName, TableName;
GO

--d.List of Primary Key and Foreign Key for Whole Database.
SELECT 
    t.TABLE_SCHEMA,
    t.TABLE_NAME,
	c.CONSTRAINT_TYPE,
	c.CONSTRAINT_NAME
FROM 
    INFORMATION_SCHEMA.TABLES t
LEFT JOIN
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS c
	ON t.TABLE_SCHEMA = c.TABLE_SCHEMA 
    AND t.TABLE_NAME = c.TABLE_NAME 
	AND c.CONSTRAINT_TYPE IN ('PRIMARY KEY', 'FOREIGN KEY') -- joins the t.tables table with the c.constraints table and provides conditions to only include primary key and foreign key records.
ORDER BY 
    t.TABLE_SCHEMA, 
    t.TABLE_NAME;
GO

--e. Get all Nullable columns from a table
SELECT 
    COLUMN_NAME,
	TABLE_NAME,
	TABLE_SCHEMA
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
   IS_NULLABLE = 'YES';
GO

--f. Get All table that do not have primary key.
SELECT 
    t.TABLE_SCHEMA,
    t.TABLE_NAME
FROM 
    INFORMATION_SCHEMA.TABLES t
WHERE 
	NOT EXISTS ( --will check if the following parameters do not exist, in this case Primary Key. If no PK exists, then the table schema and name will output.
        SELECT *
        FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS c
        WHERE 
            c.TABLE_SCHEMA = t.TABLE_SCHEMA 
            AND c.TABLE_NAME = t.TABLE_NAME 
            AND c.CONSTRAINT_TYPE = 'PRIMARY KEY'
    )
ORDER BY 
    t.TABLE_SCHEMA, 
    t.TABLE_NAME;
GO

--g. Get All table that do not have identity column.
--An identity column is a column that auto generates values, such as the GETDATE and AUTO INCREMENT (IDENTITY)
USE[Movies]
GO

SELECT 
    t.name AS TableName
FROM 
    sys.tables t
WHERE 
    NOT EXISTS ( --similar to query above, checks if the condition does not exist (is_identity column equal 1 in the sys.column) and returns records that don't meet the condition. In this case, all tables have identity columns.
        SELECT 1
        FROM sys.columns c
        WHERE 
            c.object_id = t.object_id
            AND c.is_identity = 1
    )
ORDER BY 
    t.name;
GO

--h. Get First Date of Current Month.
SELECT DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1) AS 'First Date of Current Month';
GO

--i. Get Last date of Current month.
SELECT EOMONTH(GETDATE()) AS 'Last Date of Current Month';
GO

--j. Get the first date of the next month. Cast as data instead of date + timestamp
SELECT CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) + 1, 0) AS DATE) AS 'First Date of Next Month';
GO

--k. Get the last date of the next month
SELECT CAST(DATEADD(DAY, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) + 2, 0)) AS DATE) AS 'Last Date of Next Month';
GO

--l. Get all the information from the tables.
SELECT * 
FROM INFORMATION_SCHEMA.TABLES;
GO

--m. Get all columns contain any constraints.
SELECT 
    COLUMN_NAME, CONSTRAINT_NAME
FROM 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
ORDER BY 
    COLUMN_NAME;

-- n. Get all tables that contain a view.
SELECT DISTINCT
    v.name AS ViewName,
    t.name AS TableName
FROM 
    sys.views v
JOIN 
    sys.sql_expression_dependencies sed ON v.object_id = sed.referencing_id
JOIN 
    sys.tables t ON sed.referenced_id = t.object_id
ORDER BY
    v.name, t.name;

--o. Get all columns of table that using in views.
SELECT DISTINCT
    v.name AS ViewName,
    t.name AS TableName,
    c.name AS ColumnName
FROM 
    sys.views v
JOIN 
    sys.sql_expression_dependencies sed ON v.object_id = sed.referencing_id
JOIN 
    sys.columns c ON sed.referenced_id = c.object_id
JOIN 
    sys.tables t ON c.object_id = t.object_id
ORDER BY
    v.name, t.name, c.name;

/*
End of Assignment
*/


