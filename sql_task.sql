CREATE DATABASE IDMB;
USE IDMB;
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    release_year INT,
    description TEXT
);
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type VARCHAR(50),
    url VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating >= 0 AND rating <= 10),
    comment TEXT,
    review_date DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE
);
CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100)
);
CREATE TABLE ArtistSkill (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) 
);
CREATE TABLE MovieArtistRole (
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY (movie_id, artist_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
INSERT INTO Movie (title, release_year, description)
VALUES ('Inception', 2010, 'A mind-bending thriller by Christopher Nolan.');
INSERT INTO Media (movie_id, media_type, url)
VALUES (1, 'Trailer', 'https://youtube.com/inception-trailer');
INSERT INTO Genre (name) VALUES ('Sci-Fi'), ('Thriller');
INSERT INTO MovieGenre (movie_id, genre_id) VALUES (1, 1), (1, 2);
INSERT INTO User (username, email) VALUES ('john_doe', 'john@example.com');
INSERT INTO Review (movie_id, user_id, rating, comment, review_date)
VALUES (1, 1, 9, 'Amazing movie with layers!', NOW());
INSERT INTO Artist (name, dob) VALUES ('Leonardo DiCaprio', '1974-11-11');
INSERT INTO Skill (skill_name) VALUES ('Acting'), ('Singing');
INSERT INTO ArtistSkill (artist_id, skill_id) VALUES (1, 1); 
INSERT INTO Role (role_name) VALUES ('Actor'), ('Director');
INSERT INTO MovieArtistRole (movie_id, artist_id, role_id)
VALUES (1, 1, 1); 

SELECT * FROM Skill;
SELECT * FROM ArtistSkill;
SELECT * FROM Role;
SELECT * FROM MovieArtistRole;
SELECT * FROM Movie;
SELECT * FROM Media;
SELECT * FROM Review;
