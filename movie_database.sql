CREATE DATABASE MOVIE;
USE MOVIE;

CREATE TABLE DIRECTOR (
    Director_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE
);

CREATE TABLE GENRE (
    Genre_ID VARCHAR(10) PRIMARY KEY,
    Genre_Name VARCHAR(50)
);

CREATE TABLE ACTOR (
    Actor_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE
);

CREATE TABLE USERS (
    User_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE USER_EMAIL (
    User_ID VARCHAR(10),
    Email VARCHAR(50),
    PRIMARY KEY (User_ID, Email),
    FOREIGN KEY (User_ID) REFERENCES USERS(User_ID)
);

CREATE TABLE MOVIE (
    Movie_ID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Director_ID VARCHAR(10),
    Duration INT,
    Release_Year INT,
    FOREIGN KEY (Director_ID) REFERENCES DIRECTOR(Director_ID)
);

CREATE TABLE MOVIE_LANGUAGE (
    Movie_ID VARCHAR(10),
    Language VARCHAR(30),
    PRIMARY KEY (Movie_ID, Language),
    FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID)
);

CREATE TABLE MOVIE_GENRE (
    Movie_ID VARCHAR(10),
    Genre_ID VARCHAR(10),
    PRIMARY KEY (Movie_ID, Genre_ID),
    FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID),
    FOREIGN KEY (Genre_ID) REFERENCES GENRE(Genre_ID)
);

CREATE TABLE MOVIE_ACTOR (
    Movie_ID VARCHAR(10),
    Actor_ID VARCHAR(10),
    PRIMARY KEY (Movie_ID, Actor_ID),
    FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID),
    FOREIGN KEY (Actor_ID) REFERENCES ACTOR(Actor_ID)
);

CREATE TABLE RATING (
    Rating_ID VARCHAR(10) PRIMARY KEY,
    Movie_ID VARCHAR(10),
    User_ID VARCHAR(10),
    Rating_Value DECIMAL(3,1),
    Review VARCHAR(255),
    FOREIGN KEY (Movie_ID) REFERENCES MOVIE(Movie_ID),
    FOREIGN KEY (User_ID) REFERENCES USERS(User_ID)
);


INSERT INTO DIRECTOR VALUES
('D01', 'Christopher Nolan', '1970-07-30'),
('D02', 'Steven Spielberg', '1946-12-18'),
('D03', 'Rajkumar Hirani', '1962-11-20'),
('D04', 'S. S. Rajamouli', '1973-10-10'),
('D05', 'Sanjay Leela Bhansali', '1963-02-24');


INSERT INTO GENRE VALUES
('G01', 'Action'),
('G02', 'Drama'),
('G03', 'Science Fiction'),
('G04', 'Thriller'),
('G05', 'Comedy'),
('G06', 'Adventure'),
('G07', 'Romance');

INSERT INTO ACTOR VALUES
('A01', 'Leonardo DiCaprio', '1974-11-11'),
('A02', 'Matthew McConaughey', '1969-11-04'),
('A03', 'Christian Bale', '1974-01-30'),
('A04', 'Aamir Khan', '1965-03-14'),
('A05', 'Shah Rukh Khan', '1965-11-02'),
('A06', 'Ram Charan', '1985-03-27'),
('A07', 'Jr NTR', '1983-05-20'),
('A08', 'Tom Hanks', '1956-07-09'),
('A09', 'Anne Hathaway', '1982-11-12'),
('A10', 'Deepika Padukone', '1986-01-05');

INSERT INTO USERS VALUES
('U01', 'Rahul Sharma'),
('U02', 'Amit Verma'),
('U03', 'Priya Singh'),
('U04', 'Mohd Aftab'),
('U05', 'Neha Gupta');

INSERT INTO USER_EMAIL VALUES
('U01', 'rahul@gmail.com'),
('U01', 'rahul@college.edu'),
('U02', 'amit@gmail.com'),
('U03', 'priya@gmail.com'),
('U04', 'aftab@gmail.com'),
('U04', 'aftab@college.edu'),
('U05', 'neha@gmail.com');

INSERT INTO MOVIE VALUES
('M01', 'Inception', 'D01', 148, 2010),
('M02', 'Interstellar', 'D01', 169, 2014),
('M03', 'The Dark Knight', 'D01', 152, 2008),
('M04', 'Jurassic Park', 'D02', 127, 1993),
('M05', '3 Idiots', 'D03', 170, 2009),
('M06', 'RRR', 'D04', 187, 2022),
('M07', 'Dangal', 'D03', 161, 2016),
('M08', 'Forrest Gump', 'D02', 142, 1994),
('M09', 'The Prestige', 'D01', 130, 2006),
('M10', 'Padmaavat', 'D05', 164, 2018);

INSERT INTO MOVIE_LANGUAGE VALUES
('M01', 'English'),
('M01', 'Hindi'),
('M02', 'English'),
('M02', 'Hindi'),
('M03', 'English'),
('M04', 'English'),
('M05', 'Hindi'),
('M05', 'English'),
('M06', 'Telugu'),
('M06', 'Hindi'),
('M06', 'Tamil'),
('M07', 'Hindi'),
('M08', 'English'),
('M09', 'English'),
('M10', 'Hindi');

INSERT INTO MOVIE_GENRE VALUES
('M01', 'G03'),
('M01', 'G04'),
('M02', 'G03'),
('M02', 'G02'),
('M03', 'G01'),
('M03', 'G04'),
('M04', 'G06'),
('M04', 'G03'),
('M05', 'G05'),
('M05', 'G02'),
('M06', 'G01'),
('M06', 'G02'),
('M07', 'G02'),
('M07', 'G06'),
('M08', 'G02'),
('M08', 'G05'),
('M09', 'G04'),
('M09', 'G02'),
('M10', 'G02'),
('M10', 'G01');

INSERT INTO MOVIE_ACTOR VALUES
('M01', 'A01'),
('M01', 'A09'),
('M02', 'A02'),
('M02', 'A09'),
('M03', 'A03'),
('M04', 'A08'),
('M05', 'A04'),
('M06', 'A06'),
('M06', 'A07'),
('M07', 'A04'),
('M08', 'A08'),
('M09', 'A01'),
('M10', 'A05'),
('M10', 'A10');

INSERT INTO RATING VALUES
('R01', 'M01', 'U01', 9.0, 'Excellent mind-bending movie'),
('R02', 'M01', 'U02', 8.5, 'Amazing storyline'),
('R03', 'M02', 'U03', 9.5, 'One of the best sci-fi movies'),
('R04', 'M03', 'U01', 9.0, 'Outstanding performance'),
('R05', 'M04', 'U04', 8.0, 'Classic adventure movie'),
('R06', 'M05', 'U02', 9.5, 'Very inspiring movie'),
('R07', 'M06', 'U03', 9.0, 'Excellent action sequences'),
('R08', 'M07', 'U05', 9.0, 'Powerful performances'),
('R09', 'M08', 'U04', 8.5, 'Emotional and beautiful'),
('R10', 'M09', 'U05', 9.0, 'Brilliant plot twist'),
('R11', 'M10', 'U01', 7.5, 'Good cinematography'),
('R12', 'M02', 'U04', 10.0, 'A masterpiece');


SELECT * FROM DIRECTOR;
SELECT * FROM GENRE;
SELECT * FROM ACTOR;
SELECT * FROM USERS;
SELECT * FROM USER_EMAIL;
SELECT * FROM MOVIE;
SELECT * FROM MOVIE_LANGUAGE;
SELECT * FROM MOVIE_GENRE;
SELECT * FROM MOVIE_ACTOR;
SELECT * FROM RATING;

