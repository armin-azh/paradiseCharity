-- Auth_User
CREATE OR REPLACE FUNCTION check_max_register_user()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
DECLARE
	num_users INT;
BEGIN
	SELECT COUNT(*) INTO num_users FROM auth_user;
	IF num_users>=5 THEN
		RAISE 'YOU REACH THE MAXIMUM USERS: %',num_users;
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END;
$$;

CREATE OR REPLACE FUNCTION update_user_log_in_time()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	IF NEW.last_login<>OLD.last_login THEN
		NEW.last_login = current_timestamp;
	END IF;
	RETURN NEW;
END;
$$;

-- Auth_User_Group
CREATE OR REPLACE FUNCTION check_max_user_in_group()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS
$$
    DECLARE
        ng_user INT;
    BEGIN
        SELECT COUNT(*) INTO ng_user FROM auth_user_groups WHERE user_id = NEW.user_id;
        IF ng_user > 4 THEN
            RAISE 'THIS USER REACHED HIS MAXIMUM GROUP';
        END IF ;

    END;
$$;


-- Payment
CREATE OR REPLACE FUNCTION insert_new_payment()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
DECLARE
	order_id INT;
BEGIN
	SELECT id INTO order_id FROM "order" WHERE donation_id =NEW.donation_id;
	IF order_id<>NULL THEN
		RETURN NEW;
	ELSE
		RAISE 'YOU WANT TO CREATE A PAYMENT WITHOUT ANY ORDER SUBMITION';
	END IF;
END;
$$;

-- User Person

CREATE OR REPLACE FUNCTION update_user_person()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS

$$
    BEGIN
        IF OLD.id = NEW.id THEN
            CALL update_email_user_person(NEW.id,NEW.email);
            RETURN NEW;
        END IF;
    END;
$$;

