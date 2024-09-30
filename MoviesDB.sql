CREATE DATABASE MOVIESDB;
USE MOVIESDB;
-- Actors Table
CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    bio TEXT
);

-- Directors Table
CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    bio TEXT
);

-- Genres Table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year YEAR,
    director_id INT,
    genre_id INT,
    description TEXT,
    rating DECIMAL(3,2),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Cast Table
CREATE TABLE Cast (
    cast_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    role VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    review_date DATE,
    reviewer_name VARCHAR(100),
    rating DECIMAL(3,2),
    comment TEXT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Awards Table
CREATE TABLE Awards (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    award_name VARCHAR(100),
    award_year YEAR,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Inserting values into Actors Table
INSERT INTO Actors (first_name, last_name, date_of_birth, gender, bio)
VALUES 
('Robert', 'Downey Jr.', '1965-04-04', 'Male', 'Known for Iron Man.'),
('Scarlett', 'Johansson', '1984-11-22', 'Female', 'Known for Black Widow.');

-- Inserting values into Directors Table
INSERT INTO Directors (first_name, last_name, date_of_birth, bio)
VALUES 
('Steven', 'Spielberg', '1946-12-18', 'Famous director known for Jurassic Park.'),
('Christopher', 'Nolan', '1970-07-30', 'Known for The Dark Knight Trilogy.');

-- Inserting values into Genres Table
INSERT INTO Genres (genre_name)
VALUES 
('Action'),
('Drama'),
('Comedy'),
('Thriller');

-- Inserting values into Movies Table
INSERT INTO Movies (title, release_year, director_id, genre_id, description, rating)
VALUES 
('Inception', 2010, 2, 4, 'A mind-bending thriller.', 8.8),
('Jurassic Park', 1993, 1, 1, 'A sci-fi adventure.', 8.1);

-- Inserting values into Cast Table
INSERT INTO Cast (movie_id, actor_id, role)
VALUES 
(1, 1, 'Dom Cobb'),
(2, 2, 'Dr. Alan Grant');

-- Inserting values into Reviews Table
INSERT INTO Reviews (movie_id, review_date, reviewer_name, rating, comment)
VALUES 
(1, '2024-08-25', 'John Doe', 9.0, 'Amazing movie with great plot twists!'),
(2, '2024-08-26', 'Jane Smith', 8.0, 'A classic that never gets old.');

-- Inserting values into Awards Table
INSERT INTO Awards (movie_id, award_name, award_year)
VALUES 
(1, 'Best Visual Effects', 2011),
(2, 'Best Sound Editing', 1994);
