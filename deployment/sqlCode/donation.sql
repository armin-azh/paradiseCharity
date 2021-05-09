-- These queries are for Donation Package

DROP TABLE IF EXISTS donation;

CREATE TABLE donation
(
	id SERIAL PRIMARY KEY,
	donation_name VARCHAR(50) NOT NULL,
	description VARCHAR(150) NULL,
	created TIMESTAMPTZ NOT NULL,
	updated TIMESTAMPTZ NOT NULL,
	category_id INT NULL,
	event_id INT NULL,
	user_id INT NULL,
	needy_id INT NOT NULL,
	
	CONSTRAINT fk_category
				FOREIGN KEY(category_id)
				REFERENCES category(id)
				ON DELETE SET NULL,
	CONSTRAINT fk_event
				FOREIGN KEY(event_id)
				REFERENCES event(id)
				ON DELETE SET NULL,
	CONSTRAINT fk_user
				FOREIGN KEY(user_id)
				REFERENCES userperson(id)
				ON DELETE SET NULL,
	CONSTRAINT fk_needy
				FOREIGN KEY(needy_id)
				REFERENCES needy(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;