-- Return the current count of precinct
DROP FUNCTION IF EXISTS get_precinct_current;
CREATE OR REPLACE FUNCTION get_precinct_current(p_id integer)
    RETURNS integer
    LANGUAGE plpgsql
    AS $function$
DECLARE
    retval integer := 0;
BEGIN
    retval := count(*) from rt_precinct where id = p_id;
    if retval = 0 then
        return 0;
    end if;
    retval := current from rt_precinct_monitor where id = p_id;
    return retval;
end;
$function$;
