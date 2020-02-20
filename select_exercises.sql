USE codeup_test_db;
SELECT 'All Pink Floyd Albums in Table => ', name FROM albums WHERE artist = 'Pink Floyd';
SELECT 'Release Date of ''Sgt. Pepper''s Lonely Hearts Club Band'' => ', release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT 'Genre of ''Nevermind'' => ', genre FROM albums WHERE name = 'Nevermind';
SELECT  'Albums Released 1990-1999 => ', id, artist, name, release_date, sales, genre FROM albums WHERE release_date BETWEEN 1990 AND 2000;
SELECT  'Albums with Less Than 20mil Sales => ', id, artist, name, release_date, sales, genre FROM albums WHERE sales < 20;
SELECT  'Genre: Rock => ', id, artist, name, release_date, sales, genre FROM albums WHERE genre = 'Rock';
SELECT name AS 'Albums Released After 1980' FROM albums WHERE release_date > 1980;