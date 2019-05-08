select
    array_to_json(array_agg(row_to_json(t)))
from (
    select
        id,
        name,
        abbreviation
    from
        rt_region
    order by
        name
    ) t;
