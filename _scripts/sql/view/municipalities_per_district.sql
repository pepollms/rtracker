drop view if exists view_rt_municipalities_per_district;
create or replace view view_rt_municipalities_per_district
    (district_id, district, municipality_count)
as
    select
        rt_district.id,
        rt_district.name,
        count(rt_municipality.id)
    from
        rt_municipality
        inner join rt_district on (rt_municipality.district_id = rt_district.id)
    group by
        rt_district.id,
        rt_district.name
    order by
        rt_district.name;
