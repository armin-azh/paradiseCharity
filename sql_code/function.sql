CREATE OR REPLACE FUNCTION proc_update_admin_login(person_id INT) RETURNS BOOLEAN LANGUAGE plpgsql
    AS
    $$
    DECLARE
        status BOOLEAN;
        p_id INT;
    BEGIN
        SELECT id INTO p_id FROM auth_user WHERE id = person_id;
        IF p_id=person_id THEN

                UPDATE auth_user
                SET last_login=now()
                WHERE id=person_id;

                status=TRUE;
                RETURN status;
        ELSE
            status:=FALSE;
            RETURN status;
        END IF;
    END;
    $$;

CREATE OR REPLACE FUNCTION proc_check_admin_permission(person_id INT,perm_id INT) RETURNS BOOLEAN LANGUAGE plpgsql
    AS
    $$
    DECLARE
        p_cnt INT;
    BEGIN
        select count(*) INTO p_cnt
        from auth_user aa
        INNER JOIN auth_user_user_permissions auup
        on aa.id = auup.user_id
        where auup.permission_id=perm_id and aa.id=person_id;
        IF p_cnt>0 THEN
                RETURN TRUE;
        ELSE
            RETURN False;
        END IF;
    END;
    $$;

CREATE OR REPLACE FUNCTION proc_delete_empty_group() RETURNS void LANGUAGE plpgsql
    AS
    $$
    declare
        group_ids INT;
    BEGIN
        select id INTO group_ids from auth_group where id  not in (select ag.id from auth_group ag  inner join auth_user_groups aug on ag.id = aug.group_id);
        delete from auth_group
        where id in (group_ids);
    END;
    $$;

CREATE OR REPLACE FUNCTION proc_create_arp_user_table() RETURNS void LANGUAGE plpgsql
    AS
    $$
    BEGIN
        create table arp_user(
            first_name varchar(255),
            last_name varchar(255),
            national_code varchar(255),
            type varchar(255)
        );
    END;
    $$;

CREATE OR REPLACE FUNCTION proc_insert_to_arp_user() RETURNS void LANGUAGE plpgsql
    AS
    $$
    BEGIN
        drop table if exists arp_user;
        perform proc_create_arp_user_table();
        insert into arp_user(first_name, last_name, national_code, type)
        select first_name,last_name,'empty' as national_code,'admin' as type From auth_user;

        insert into arp_user(first_name, last_name, national_code, type)
        select first_name,last_name,national_code,'needy' as type from needy;

    END
    $$;