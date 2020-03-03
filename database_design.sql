use codeup_test_db;
# CREATE TABLE IF NOT EXISTS users
# (
#     id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     email    VARCHAR(60),
#     password VARCHAR(255),
#     PRIMARY KEY (id),
#     CONSTRAINT uc_email UNIQUE (email)
# );
#
# -- Users create ads with a title and description in category
# CREATE TABLE IF NOT EXISTS ads
# (
#     id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     title       VARCHAR(40),
#     description VARCHAR(255),
#     category    VARCHAR(20),
#     user_id     INT UNSIGNED,
#     FOREIGN KEY (user_id) REFERENCES users (id),
#     PRIMARY KEY (id)
# );
#
# -- categories
# CREATE TABLE IF NOT EXISTS categories
# (
#     id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     category VARCHAR(20),
#     user_id  INT UNSIGNED,
#     FOREIGN KEY (user_id) REFERENCES users (id),
#     PRIMARY KEY (id)
# );
#
# -- category_ads
# CREATE TABLE IF NOT EXISTS category_ads
# (
#     id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     category_id INT UNSIGNED,
#     ad_id       INT UNSIGNED,
#     FOREIGN KEY (ad_id) REFERENCES users (id),
#     FOREIGN KEY (category_id) REFERENCES categories (id),
#     PRIMARY KEY (id)
# );
# -- For a given ad, what is the email address of the user that created it?
# SELECT email
# FROM users
# WHERE id IN
#       (
#           SELECT user_id
#           FROM ads
#           WHERE ads.id = ?
#       );
#
# -- For a given ad, what category, or categories, does it belong to?
# SELECT category
# FROM ads
# WHERE id IN
#       (
#           SELECT category_id
#           FROM category_ads
#           WHERE ads.id = ?
#       );
# -- For a given category, show all the ads that are in that category.
# SELECT title
# FROM ads
#          JOIN category_ads AS ca on ads.id = ca.ad_id
# WHERE category_id = ?
# -- For a given user, show all the ads they have posted.
# # 1) For a given ad, what is the email address of the user that created it?
# SELECT email
# FROM ads
#          JOIN users ON users.id = ads.user_id;
# # 2) For a given ad, what category, or categories, does it belong to?
# SELECT category
# FROM ads AS a
#          JOIN category_ads AS ca ON a.id = ca.ads_id
#          JOIN categories AS cat ON ca.category_id = cat.id;
# # 3) For a given category, show all the ads that are in that category.
# SELECT title
# FROM categories AS cat
#          JOIN category_ads AS ca ON cat.id = ca.category_id
#          JOIN ads ON ca.ads_id = ads.id;
# # 4) For a given user, show all the ads they have posted.
# SELECT title, description
# FROM users
#          JOIN ads ON users.id = ads.user_id
# WHERE users.id = 5;
# CREATE TABLE IF NOT EXISTS users
# (
#     id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     email    VARCHAR(60),
#     password VARCHAR(255),
#     PRIMARY KEY (id),
#     CONSTRAINT uc_email UNIQUE (email)
# );
# -- Users create ads with a title and description and category.
# CREATE TABLE IF NOT EXISTS ads
# (
#     id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     title       VARCHAR(40),
#     description VARCHAR(255),
#     user_id     INT,
#     FOREIGN KEY (user_id) REFERENCES users (id),
#     PRIMARY KEY (id)
# );
# -- categories
# CREATE TABLE IF NOT EXISTS categories
# (
#     id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     category VARCHAR(20),
#     PRIMARY KEY (id)
# );
# -- category_ads
# CREATE TABLE IF NOT EXISTS category_ads
# (
#     category_id INT,
#     ads_id      INT,
#     FOREIGN KEY (category_id) REFERENCES categories (id),
#     FOREIGN KEY (ads_id) REFERENCES ads (id)
# );

-- QUIZ THING FOR BONUS
-- Users
-- Design User table

# Quizzes
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS quizzes;
DROP TABLE IF EXISTS users;
CREATE TABLE quizzes
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title   VARCHAR(40),
    subject VARCHAR(20),
    PRIMARY KEY (id)
);
# Users
CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    role     CHAR NOT NULL, -- 'A' is admin, 'S' is Student
    username VARCHAR(20)  NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id)
);
# Results
CREATE TABLE results
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    users_id   INT UNSIGNED,
    quizzes_id INT UNSIGNED,
    score      FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (users_id) REFERENCES users (id),
    FOREIGN KEY (quizzes_id) REFERENCES quizzes (id)
);

# Question
CREATE TABLE questions
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    quiz_id  INT UNSIGNED,
    txt      TEXT,
    response CHAR(20),
    FOREIGN KEY (quiz_id) REFERENCES quizzes (id),
    PRIMARY KEY (id)
);

# Answers
CREATE TABLE answers
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    txt         TEXT,
    correct     CHAR, -- (R/W)
    question_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);


SELECT COUNT(*) AS 'Number of students that have taken'
FROM
(
    SELECT DISTINCT users_id
    FROM results AS r
    JOIN quizzes AS q ON q.id = r.quizzes_id AND q.id = 5
) as rq;
