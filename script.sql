-- Creating a table
CREATE TABLE bands(
	-- ColumnName dataType constraint
	id SERIAL PRIMARY KEY,
	band_name VARCHAR(255) NOT NULL,
	genre VARCHAR(255)
);

DROP TABLE bands;


-- gets you all rows from bands table
SELECT * FROM bands;

INSERT INTO bands(band_name, genre) VALUES
('Ammar band','None'),
('Omar Band','None'),
('Ahmed Band','None');



SELECT band_name, id from bands;


SELECT * FROM bands
WHERE genre='Rock';

-- ORDER BY: orders the values in ascending order
SELECT * FROM bands
ORDER BY band_name DESC;

-- partial match
SELECT * FROM bands
WHERE band_name ILIKE '%a%';


-- AND
SELECT * FROM bands
WHERE band_name = 'The Beatles' AND genre = 'Rock';

-- OR
SELECT * FROM bands
WHERE band_name = 'The Beatles' OR genre = 'None';


CREATE TABLE songs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	length INTEGER CHECK( length > 0 AND length < 3000),
	band_id INTEGER REFERENCES bands(id)
);

SELECT * FROM bands;
SELECT * FROM songs;


INSERT INTO songs(name, length,band_id)
VALUES('my song',200,3);


SELECT 
	bands.id AS band_id,
	songs.id AS song_id,
	songs.length AS song_length,
	bands.genre
FROM songs
JOIN bands ON bands.id = songs.band_id;


