drop view if exists view_rt_barangays_per_municipality;
create or replace view view_rt_barangays_per_municipality
    (district_id, district, municipality_id, municipality, barangay_count)
as
    select
        rt_district.id,
        rt_district.name,
        rt_municipality.id,
        rt_municipality.name,
        count(rt_barangay.id)
    from
        rt_barangay
        inner join rt_municipality on (rt_barangay.municipality_id = rt_municipality.id)
        inner join rt_district on (rt_municipality.district_id = rt_district.id)
    group by
        rt_district.id,
        rt_district.name,
        rt_municipality.id,
        rt_municipality.name
    order by
        rt_district.name,
        rt_municipality.name;
