CREATE or REPLACE FUNCTION 	add_activity_with_title (title varchar(200)) RETURNS bigint AS $$
    insert into activity(id, title)
    values (nextval('id_generator'), add_activity_with_title.title)
    returning id;
$$ LANGUAGE SQL;
