drop view if exists view_rt_import_current;
create or replace view view_rt_import_current
    (municipality_id,
        municipality,
        barangay_id,
        barangay,
        precinct_id,
        precinct,
        nac,
        rtt,
        undecided_1,
        sfp,
        ltm,
        undecided_2,
        imported_when)
as
    select
        rt_municipality.id,
        rt_municipality.name,
        rt_barangay.id,
        rt_barangay.name,
        rt_precinct.id,
        rt_precinct.name,
        rt_import_current.nac,
        rt_import_current.rtt,
        rt_import_current.undecided_1,
        rt_import_current.sfp,
        rt_import_current.ltm,
        rt_import_current.undecided_2,
        rt_import_current.imported_when
    from
        rt_import_current
        inner join rt_municipality on (rt_municipality.id = rt_import_current.municipality_code)
        inner join rt_barangay on (rt_barangay.municipality_id = rt_municipality.id)
        inner join rt_precinct on (rt_precinct.barangay_id = rt_barangay.id)
    where
        rt_precinct.name = rt_import_current.precinct
    order by
        rt_municipality.name,
        rt_barangay.name,
        rt_precinct.name;
