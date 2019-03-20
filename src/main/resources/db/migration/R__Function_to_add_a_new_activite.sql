CREATE OR REPLACE FUNCTION add_activity_with_title(title character varying(200)) RETURNS bigint AS $$
   INSERT INTO activity VALUES ((SELECT nextval('id_generator')), add_activity_with_title.title)
   -- id accessible car tous les champs de la ligne créé précédament sont accessibles
   RETURNING id;  
$$ LANGUAGE SQL;