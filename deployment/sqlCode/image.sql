-- Table Image

DROP TABLE IF EXISTS image;

CREATE TABLE image(
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	file VARCHAR(100) NOT NULL,
	width INT NOT NULL,
	height INT NOT NULL,
	file_size INT NOT NULL,
	file_hash VARCHAR(40) NOT NULL
)

TABLESPACE pg_default;