USE codeup_test_db;
SELECT 'All Albums => ', id, artist, name, release_date, sales, genre FROM albums;
UPDATE albums SET sales = sales * 10;
SELECT 'All Albums => ', id, artist, name, release_date, sales, genre FROM albums;
SELECT  'Albums Release Before 1980 => ', id, artist, name, release_date, sales, genre FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;
SELECT  'Albums Release Before 1980 => ', id, artist, name, release_date, sales, genre FROM albums WHERE release_date < 1980;
SELECT  'Artist: Michael Jackson => ', id, artist, name, release_date, sales, genre FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
SELECT  'Artist: Michael Jackson => ', id, artist, name, release_date, sales, genre FROM albums WHERE artist = 'Peter Jackson';