drop view if exists view_rt_districts_per_province;
create or replace view view_rt_districts_per_province
    (province_id, province, district_count)
as
    select
        rt_province.id,
        rt_province.name,
        count(rt_district.id)
    from
        rt_province
        inner join rt_district on (rt_province.id = rt_district.province_id)
    group by
        rt_province.id,
        rt_province.name
    order by
        rt_province.name;
