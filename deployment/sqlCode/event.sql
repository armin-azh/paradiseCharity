-- Table Category
-- This table is adopt from Category model

DROP TABLE IF EXISTS eventdetail;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS category;

CREATE TABLE category
(
	id SERIAL PRIMARY KEY,
	cat_name VARCHAR(50) UNIQUE,
	cat_description VARCHAR(100) NULL
)

TABLESPACE pg_default;


-- Table Event
-- This table is adopt from Event model

CREATE TABLE event
(
	id SERIAL PRIMARY KEY,
	event_name VARCHAR(50) NOT NULL,
	event_description TEXT NULL,
	created TIMESTAMP NOT NULL,
	updated TIMESTAMP NOT NULL,
	category_id INT NOT NULL,
	CONSTRAINT fk_category
				FOREIGN KEY(category_id)
				REFERENCES category(id)
				ON DELETE SET NULL
)

TABLESPACE pg_default;


-- Table eventdetail
-- This table is adopt from EventDetail model

CREATE TABLE eventdetail
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	image_id INT NOT NULL,
	event_id INT NOT NULL,
	CONSTRAINT fk_event
				FOREIGN KEY(event_id)
				REFERENCES event(id)
				ON DELETE CASCADE,
	CONSTRAINT fk_image
				FOREIGN KEY(image_id)
				REFERENCES image(id)
				ON DELETE CASCADE
	
)

TABLESPACE pg_default;


-- Table eventneedy
-- This table is adopt from EventNeedy model

CREATE TABLE eventneedy
(
	id SERIAL PRIMARY KEY,
	event_id INT NOT NULL,
	needy_id INT NOT NULL,
	CONSTRAINT fk_event
				FOREIGN KEY(event_id)
				REFERENCES event(id)
				ON DELETE CASCADE,
	CONSTRAINT fk_needy
				FOREIGN KEY(needy_id)
				REFERENCES needy(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;