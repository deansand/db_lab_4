DROP DATABASE IF EXISTS lab_1;
CREATE DATABASE lab_1;
USE lab_1;


CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) UNIQUE
);


INSERT INTO countries (country_name) VALUES ('USA'), ('South Korea');


CREATE TABLE directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(100),
    INDEX (name)
);


CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    descriptions TEXT,
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id) ON DELETE SET NULL,
    INDEX (title)
);


CREATE TABLE actor (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(255),
    birth_date DATE,
    nationality VARCHAR(100),
    INDEX (actor_name)
);


CREATE TABLE movie_cast (
    movie_id INT,
    actor_id INT,
    role_name VARCHAR(255),
    PRIMARY KEY (movie_id, actor_id, role_name),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON DELETE CASCADE,
    INDEX (movie_id, actor_id)
);


CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    password_hash VARCHAR(255),
    registration_date DATE,
    UNIQUE(email),
    INDEX (username)
);


CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 10),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX (movie_id, user_id)
);


CREATE TABLE fun_fact (
    fact_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT UNIQUE,
    fact TEXT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    INDEX (movie_id)
);


CREATE TABLE money_get (
    movie_id INT,
    country_id INT,
    revenue DECIMAL(15, 2),
    PRIMARY KEY (movie_id, country_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX (country_id)
);


CREATE TABLE gener (
    gener_id INT PRIMARY KEY AUTO_INCREMENT,
    gener_name VARCHAR(100),
    INDEX (gener_name)
);


CREATE TABLE movie_gener (
    movie_id INT,
    gener_id INT,
    PRIMARY KEY (movie_id, gener_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (gener_id) REFERENCES gener(gener_id) ON DELETE CASCADE,
    INDEX (movie_id, gener_id)
);

INSERT INTO directors (name, birth_date, nationality)
VALUES
('Christopher Nolan', '1970-07-30', 'UK'),
('The Wachowskis', '1965-06-21', 'USA'),
('Bong Joon-ho', '1969-09-14', 'South Korea');

INSERT INTO movies (title, release_date, descriptions, director_id)
VALUES 
('Inception', '2010-07-16', 'A mind-bending thriller', 1),
('The Matrix', '1999-03-31', 'A dystopian sci-fi classic', 2),
('Parasite', '2019-05-30', 'A dark social satire', 3);



INSERT INTO actor (actor_name, birth_date, nationality)
VALUES
('Leonardo DiCaprio', '1974-11-11', 'USA'),
('Keanu Reeves', '1964-09-02', 'Canada'),
('Song Kang-ho', '1967-01-17', 'South Korea');


INSERT INTO movie_cast (movie_id, actor_id, role_name)
VALUES
(1, 1, 'Dom Cobb'),
(2, 2, 'Neo'),
(3, 3, 'Kim Ki-taek');

INSERT INTO users (username, email, password_hash, registration_date)
VALUES 
('user1', 'user1@example.com', 'hashed_password1', '2020-01-10'),
('user2', 'user2@example.com', 'hashed_password2', '2020-03-15'),
('user3', 'user3@example.com', 'hashed_password3', '2020-07-20');

INSERT INTO reviews (movie_id, user_id, rating, review_text, review_date)
VALUES
(1, 1, 9, 'Amazing mind-bending thriller!', '2020-05-15'),
(2, 2, 10, 'Classic sci-fi!', '2021-07-22'),
(3, 3, 8, 'Dark, but brilliant satire.', '2022-01-05');

INSERT INTO fun_fact (movie_id, fact)
VALUES
(1, 'Inception took over 14 years to make.'),
(2, 'The Matrix introduced the bullet time visual effect.');

INSERT INTO money_get (movie_id, country_id, revenue)
VALUES
(1, 1, 829895144),
(2, 1, 463517383),
(3, 2, 257987083);

INSERT INTO gener (gener_name)
VALUES
('Sci-Fi'),
('Thriller'),
('Drama');

INSERT INTO movie_gener (movie_id, gener_id)
VALUES
(1, 2),
(2, 1),
(3, 3);
