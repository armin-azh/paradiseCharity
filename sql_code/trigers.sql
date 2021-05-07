DROP TRIGGER IF EXISTS max_user_policy ON auth_user;

CREATE TRIGGER max_user_policy
	BEFORE INSERT
	ON auth_user
	EXECUTE	PROCEDURE check_max_register_user();