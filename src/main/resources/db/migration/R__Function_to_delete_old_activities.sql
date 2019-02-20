CREATE OR REPLACE FUNCTION delete_activities_older_than(old_date date) RETURNS void AS $$
   DELETE
   FROM activity
   WHERE old_date > modification_date
$$ LANGUAGE SQL;