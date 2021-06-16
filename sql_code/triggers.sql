CREATE OR REPLACE FUNCTION proc_trig_max_superuser() RETURNS trigger LANGUAGE plpgsql
    AS
    $$
    declare
        person_cnt INT;
    BEGIN
        select count(*) into person_cnt from auth_user where is_superuser=true;

        if person_cnt>=2 then
            raise 'You read maximum number of superuser';
            return null;
        else
            return new;
        end if;
    END;
    $$;


create trigger policy_max_super_user
    before insert
    on auth_user
    execute procedure proc_trig_max_superuser();

CREATE OR REPLACE FUNCTION proc_trig_update_login() RETURNS trigger LANGUAGE plpgsql
    AS
    $$
    BEGIN
        perform proc_update_admin_login(new.id);
        return new;
    END;
    $$;


create trigger update_user_login_time
    after update
    on auth_user
    execute procedure proc_trig_max_superuser();



