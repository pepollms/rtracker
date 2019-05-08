-- Insert Districts from the import table
-- District ID is auto-generated
insert into rt_district(province_id, name)
select distinct
    1,
    district || ' District' as district_name
from rt_import
order by district_name asc;

-- Insert Municipalities from the import table
insert into rt_municipality(id, district_id, name)
select distinct
    municipality_code,
    to_number(district, '9') as district_number,
    municipality
from rt_import
order by district_number, municipality asc;

-- Insert Barangays from the import table
insert into rt_barangay(municipality_id, name)
select distinct
    rt_municipality.id,
    barangay
from rt_import
    inner join rt_municipality on (rt_import.municipality = rt_municipality.name)
order by barangay asc;

-- Insert Precincts from the import table
insert into rt_precinct(barangay_id, name)
select
    (select rt_barangay.id
        from
            rt_barangay
            inner join rt_municipality on (rt_barangay.municipality_id = rt_municipality.id)
            inner join rt_district on (rt_municipality.district_id = rt_district.id)
        where
            rt_import.barangay = rt_barangay.name
            and rt_import.municipality = rt_municipality.name
            and rt_district.name like rt_import.district || '%') as bid,
    rt_import.precinct
from
    rt_import
order by
    district,
    municipality,
    barangay,
    precinct asc;

-- Insert precinct monitor values from the import table
insert into rt_precinct_monitor(precinct_id, respondents, nac, rtt, undecided_1, sfp, ltm, undecided_2)
select
    (select rt_precinct.id
        from
            rt_precinct
            inner join rt_barangay on (rt_precinct.barangay_id = rt_barangay.id)
            inner join rt_municipality on (rt_barangay.municipality_id = rt_municipality.id)
            inner join rt_district on (rt_municipality.district_id = rt_district.id)
        where
            rt_import.precinct = rt_precinct.name
            and rt_import.barangay = rt_barangay.name
            and rt_import.municipality = rt_municipality.name
            and rt_district.name like rt_import.district || '%') as bid,
    rt_import.voters,
    0,
    0,
    0,
    0,
    0,
    0
from
    rt_import;

-- Insert Leaders from the import table
-- select distinct leader from rt_import
-- -----------------------------------------------------------------------------
insert into rt_leader(name, contact)
select
    distinct leader,
    (select contact from rt_import as t where t.leader = rt_import.leader limit 1)
from
    rt_import
order by
    leader;

-- Insert Leader-Precinct assignments
-- -----------------------------------------------------------------------------
insert into rt_leader_precinct_assignment(precinct_id, leader_id)
select
    (select rt_precinct.id
        from
            rt_precinct
            inner join rt_barangay on (rt_precinct.barangay_id = rt_barangay.id)
            inner join rt_municipality on (rt_barangay.municipality_id = rt_municipality.id)
            inner join rt_district on (rt_municipality.district_id = rt_district.id)
        where
            rt_import.precinct = rt_precinct.name
            and rt_import.barangay = rt_barangay.name
            and rt_import.municipality = rt_municipality.name
            and rt_district.name like rt_import.district || '%') as precinct_id,
    (select rt_leader.id
        from
            rt_leader
        where
            rt_leader.name = rt_import.leader) as leader_id
from
    rt_import
where
    leader is not null;
