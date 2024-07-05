/** 
Final Group Project Part 1 - MS SQL
BDAT1010-24S-30691

Movie Database

Nicole Helf
Anushiya Pitchai Nadar
Fizaben Vahora

Due: July 17, 2024
**/

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

-- Create a "mov" schema under "Movies"
CREATE SCHEMA mov;
GO

--DROP tables prior to creating them to start from scratch
DROP TABLE IF EXISTS mov.Movie_Director;
DROP TABLE IF EXISTS mov.Movies;
DROP TABLE IF EXISTS mov.Movie_Actor;
DROP TABLE IF EXISTS mov.Movie_Rating;

--Create the Movie_Director table
CREATE TABLE mov.Movie_Director(
	Director_ID	int NOT NULL IDENTITY(100,10) PRIMARY KEY CLUSTERED,
	Director_First_Name varchar(50),
	Director_Last_Name varchar(50),
	Director_Age_in_Years int,
	Director_Gender varchar,
	CreatedOn date NOT NULL DEFAULT GETDATE()
);
GO

INSERT INTO mov.Movie_Director (Director_First_Name, Director_Last_Name, Director_Age_in_Years, Director_Gender)
VALUES (
	'Kevin', 'Smith', 52, 'Male',
	'Miguel', 'Arteta', 41, 'Male',
	'Mark', 'Johnson', 58, 'Male',
	'Tom', 'Vaughan', 37, 'Male',
	Francis Lawrence 52 Male
	Adrienne Shelly 40 Female
	David Slade 53 Male
	Mark Palansky 53 Male
	Jeff Lowell 49 Male
	Simon Curtis 37 Male
	Marc Lawrence 95 Male
	Anand Tucker 59 Male
	Judd Apatow 55 Male
	Cary Fukunaga 45 Male
	Mark Helfrich 49 Male
	Nanette Burstein 52 Female
	James McAvoy 44 Male
	Mark Waters 58 Male
	Seth Gordon 46 Male
	Alex Kendrick 52 Male
	Kevin Lima 60 Male
	Lasse Hallström 76 Male
	Ewan McGregor 52 Male
	Rajkumar Hirani 60 Male
	Ashutosh Gowariker 59 Male
	Karan Johar 50 Male
	S.S Rajamouli 49 Male
	Sukumar NULL 53 Male
	Aditya Chopra 51 Male
	Umesh Shukla 52 Male
