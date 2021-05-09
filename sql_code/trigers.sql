DROP TRIGGER IF EXISTS max_user_policy ON auth_user;
DROP TRIGGER IF EXISTS update_users_login ON auth_user;
DROP TRIGGER IF EXISTS insert_payment_with_order_submission ON payment;
DROP TRIGGER IF EXISTS max_user_group_policy ON auth_user_groups;

CREATE TRIGGER max_user_policy
	BEFORE INSERT
	ON auth_user
	EXECUTE	PROCEDURE check_max_register_user();
	
CREATE TRIGGER update_users_login
	BEFORE UPDATE
	ON auth_user
	EXECUTE PROCEDURE update_user_log_in_time();
	
-- PAYMENT
CREATE TRIGGER insert_payment_with_order_submission
	BEFORE INSERT
	ON payment
	EXECUTE PROCEDURE insert_new_payment();

-- Auth_User_Group
CREATE TRIGGER max_user_group_policy
    BEFORE INSERT
    ON auth_user_groups
    EXECUTE PROCEDURE check_max_user_in_group();
	