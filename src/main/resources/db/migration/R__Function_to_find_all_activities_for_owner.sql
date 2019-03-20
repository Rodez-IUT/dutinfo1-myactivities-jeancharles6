
CREATE OR REPLACE FUNCTION find_all_activities_for_owner(ownername varchar(500)) RETURNS SETOF activity AS $$
  SELECT act.* FROM activity act JOIN "user" owner ON owner_id = owner.id WHERE owner.username = ownername
$$ LANGUAGE SQL;


/*
CREATE OR REPLACE FUNCTION find_all_activities_for_owner(owner character varying(500)) RETURNS SETOF activity AS $$
  DECLARE
  	userId integer;
  BEGIN
  	userId := 1
  	--userId := select id from user where username = owner
  	--select * from activity where owner_id == userId
  END activity;
$$ LANGUAGE plpgsql;
*/