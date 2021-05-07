-- These queries are for Payment package

DROP TABLE IF EXISTS payment;

-- Table payment
-- This table is adapted from the Payment model

CREATE TABLE payment
(
	id SERIAL PRIMARY KEY,
	amount NUMERIC(10,2) NOT NULL,
	status VARCHAR(255) NULL,
	hash_card_number VARCHAR(255) NULL,
	created TIMESTAMPTZ NOT NULL,
	updated TIMESTAMPTZ NOT NULL,
	donation_id INT NOT NULL,
	
	CONSTRAINT fk_donation
				FOREIGN KEY(donation_id)
				REFERENCES donation(id)
				ON DELETE CASCADE
	
)

TABLESPACE pg_default;