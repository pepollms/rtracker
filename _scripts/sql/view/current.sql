drop view if exists view_rt_current;
create or replace view view_rt_current
    (contact,
        municipality_id,
        precinct,
        precinct_id,
        current)
as
    select
        rt_current.contact,
        rt_current.municipality_code,
        rt_current.precinct,
        rt_precinct.id,
        rt_current.current
    from
        rt_current
        inner join rt_precinct on (rt_precinct.name = rt_current.precinct)
        inner join rt_barangay on (rt_barangay.id = rt_precinct.barangay_id)
        inner join rt_municipality on (rt_municipality.id = rt_barangay.municipality_id);
