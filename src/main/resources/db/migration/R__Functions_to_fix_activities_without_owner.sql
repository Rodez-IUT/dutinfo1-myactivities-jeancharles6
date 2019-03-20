/*CREATE OR REPLACE FUNCTION get_default_owner() RETURNS bigint AS $$
  DECLARE
  userExist integer;
  defaultUsername CONSTANT VARCHAR(20) = 'Default Owner';
  
  BEGIN
  SELECT COUNT(*) INTO userExist FROM "user" WHERE username = defaultUsername;
  IF userExist != 0 THEN
	SELECT id FROM "user" WHERE username = defaultUsername;
  ELSE
  	INSERT INTO "user" VALUES ((SELECT nextval('id_generator')), defaultUsername);
  	RETURN id;
  END IF;
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fix_activities_without_owner() RETURNS record AS $$
	UPDATE activity SET owner_id = get_default_owner() WHERE owner_id IS NULL
	RETURNING activity.id
$$ LANGUAGE plpgsql;*/


CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$
	DECLARE
		defaultOwner "user"%rowtype;
		defaultOwnerUsername varchar(500) := 'Default Owner';
	BEGIN
		select * into defaultOwner from "user"
			where username = defaultOwnerUsername;
		if not found then
			insert into "user" (id, username)
				values (nextval('id_generator'), defaultOwnerUsername);
			select * into defaultOwner from "user"
				where username = defaultOwnerUsername;
		end if;
		return defaultOwner;
	END
$$ LANGUAGE plpgsql

/*CREATE OR REPLACE FUNCTION fiw_activities_without_owner() RETURNS SETOF activity &&
	DECLARE
	
	BEGIN
	
	END
&& LANGUAGE plpgsql*/









