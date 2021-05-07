-- This queries are for Person Package

DROP TABLE IF EXISTS auth_user_log;
DROP TABLE IF EXISTS auth_user_permission;
DROP TABLE IF EXISTS auth_group_permission;
DROP TABLE IF EXISTS auth_user_group;
DROP TABLE IF EXISTS auth_user;
DROP TABLE IF EXISTS auth_group;
DROP TABLE IF EXISTS auth_permission;
DROP TABLE IF EXISTS needydetail;
DROP TABLE IF EXISTS needy;
DROP TABLE IF EXISTS userperson;


-- Table auth_permission
-- This table is adapted from the Pemission model

CREATE TABLE auth_permission
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) UNIQUE NOT NULL,
	code_name VARCHAR(150) UNIQUE NOT NULL
)

TABLESPACE pg_default;

-- Table auth_group
-- This table is adapted from the Group model

CREATE TABLE auth_group
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) UNIQUE NOT NULL
)

TABLESPACE pg_default;



-- Table auth_user
-- This table is adapted from the Admin model

CREATE TABLE auth_user
(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
	username VARCHAR(150) NOT NULL,
	email VARCHAR(254) UNIQUE NOT NULL,
    password VARCHAR(255) NULL,
	is_superuser BOOLEAN NOT NULL,
	is_active BOOLEAN NOT NULL,
	is_admin BOOLEAN NOT NULL,
    last_login TIMESTAMPTZ NULL
	
)

TABLESPACE pg_default;


-- Table auth_user_group
-- This table is adapted from the UserGroup model

CREATE TABLE auth_user_group
(
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	group_id INT NOT NULL,
	CONSTRAINT fk_user
				FOREIGN KEY(user_id)
				REFERENCES auth_user(id)
				ON DELETE CASCADE,	
	CONSTRAINT fk_group
				FOREIGN KEY(group_id)
				REFERENCES auth_group(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;


-- Table auth_user_permission
-- This table is adapted from the UserPermission model

CREATE TABLE auth_user_permission
(
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	permission_id INT NOT NULL,
	CONSTRAINT fk_user
				FOREIGN KEY(user_id)
				REFERENCES auth_user(id)
				ON DELETE CASCADE,	
	CONSTRAINT fk_permission
				FOREIGN KEY(permission_id)
				REFERENCES auth_permission(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;


-- Table auth_group_permission
-- This table is adapted from the UserGroupPermission model

CREATE TABLE auth_group_permission
(
	id SERIAL PRIMARY KEY,
	group_id INT NOT NULL,
	permission_id INT NOT NULL,
	CONSTRAINT fk_permission
				FOREIGN KEY(permission_id)
				REFERENCES auth_permission(id)
				ON DELETE CASCADE,	
	CONSTRAINT fk_group
				FOREIGN KEY(group_id)
				REFERENCES auth_group(id)
				ON DELETE CASCADE	
)

TABLESPACE pg_default;


-- Table auth_user_log
-- This table is adapted from the PersonLog model

CREATE TABLE auth_user_log
(
	id SERIAL PRIMARY KEY,
	log_name VARCHAR(50) NOT NULL,
	log_level VARCHAR(50) NOT NULL,
	log_description VARCHAR(50) NULL,
	created TIMESTAMPTZ NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_user
				FOREIGN KEY(user_id)
				REFERENCES auth_user(id)
				ON DELETE CASCADE

)

TABLESPACE pg_default;



-- Table userperson
-- This table is adapted from the UserPerson model

CREATE TABLE userperson
(
	id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    password VARCHAR(255) NULL,
    city VARCHAR(50) NULL,
    country VARCHAR(50) NULL,
    street VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    postal_code VARCHAR(11) NULL,
    created TIMESTAMPTZ NOT NULL,
    last_login TIMESTAMPTZ NULL
)

TABLESPACE pg_default;


-- Table needy
-- This table is adapted from the Needy model

CREATE TABLE needy
(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    age VARCHAR(3) UNIQUE NOT NULL,
    password VARCHAR(255) NULL,
    city VARCHAR(50) NULL,
    country VARCHAR(50) NULL,
    street VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    postal_code VARCHAR(11) NULL,
    created TIMESTAMPTZ NOT NULL,
    updated TIMESTAMPTZ NOT NULL
)

TABLESPACE pg_default;


-- Table needydetail
-- This table is adapted from the NeedyDetail model

CREATE TABLE needydetail
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	intro VARCHAR(100) NULL,
	needy_id INT NOT NULL,
	image_id INT NOT NULL,
	CONSTRAINT fk_image
				FOREIGN KEY(image_id)
				REFERENCES image(id)
				ON DELETE CASCADE,
	CONSTRAINT fk_needy
				FOREIGN KEY(needy_id)
				REFERENCES needy(id)
				ON DELETE CASCADE
	
)

TABLESPACE pg_default;