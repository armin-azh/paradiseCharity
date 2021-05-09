CREATE OR REPLACE PROCEDURE update_email_user_person(user_id INT,n_email VARCHAR)
    LANGUAGE PLPGSQL
    AS
    $$
    BEGIN
        UPDATE userperson
        SET email = n_email
        WHERE id = user_id;

        COMMIT ;
    END;
    $$;