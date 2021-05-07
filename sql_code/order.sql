-- These queries are for Order Package

DROP TABLE IF EXISTS "order";


CREATE TABLE "order"(
	id SERIAL PRIMARY KEY,
	order_name VARCHAR(255) NOT NULL,
	order_description VARCHAR(255) NULL,
	status VARCHAR(20) NOT NULL,
	created TIMESTAMPTZ NOT NULL,
	updated TIMESTAMPTZ NOT NULL,
	donation_id INT NOT NULL,

	CONSTRAINT fk_donation
				FOREIGN KEY(donation_id)
				REFERENCES donation(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;