CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        artist VARCHAR(50) DEFAULT 'NONE',
                        name VARCHAR(100) NOT NULL,
                        release_date INT UNSIGNED NOT NULL,
                        sales FLOAT UNSIGNED NOT NULL,
                        genre VARCHAR(100) NOT NULL,
                        PRIMARY KEY (id)
);
DESCRIBE albums;
SHOW CREATE TABLE albums;


