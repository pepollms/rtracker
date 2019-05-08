drop view if exists view_rt_precincts_per_barangay;
create or replace view view_rt_precincts_per_barangay
    (district_id, district, municipality_id, municipality, barangay_id, barangay, precinct_count)
as
    select
        rt_district.id,
        rt_district.name,
        rt_municipality.id,
        rt_municipality.name,
        rt_barangay.id,
        rt_barangay.name,
        count(rt_precinct.id)
    from
        rt_precinct
        inner join rt_barangay on (rt_barangay.id = rt_precinct.barangay_id)
        inner join rt_municipality on (rt_barangay.municipality_id = rt_municipality.id)
        inner join rt_district on (rt_municipality.district_id = rt_district.id)
    group by
        rt_district.id,
        rt_district.name,
        rt_municipality.id,
        rt_municipality.name,
        rt_barangay.id,
        rt_barangay.name
    order by
        rt_district.name,
        rt_municipality.name,
        rt_barangay.name;
