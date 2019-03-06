CREATE OR REPLACE FONCTION find_all_activities_for_owner(nom varchar(30)) RETURNS SETOF activity AS $$
	SELECT act.*
	FROM activity act
	JOIN "user" owner
	ON owner_id=owner.id
	WHERE owner.username=nom
$$ LANGUAGE SQL;
