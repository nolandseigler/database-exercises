USE codeup_test_db;
SELECT 'ALL BEFORE DELETE OPS => ', id, artist, name, release_date, sales, genre FROM albums;
DELETE FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE genre = 'disco';
DELETE FROM albums WHERE artist = 'Whitney Houston';
SELECT 'AFTER DELETE OPS => ', id, artist, name, release_date, sales, genre FROM albums;