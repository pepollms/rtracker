drop view if exists view_rt_precinct;
create or replace view view_rt_precinct
    (district_id,
        district,
        municipality_id,
        municipality,
        barangay_id,
        barangay,
        precinct_id,
        precinct,
        leader_id,
        leader,
        leader_contact,
        respondents_sum,
        nac_sum,
        nac_percentage,
        rtt_sum,
        rtt_percentage,
        undecided_1_sum,
        undecided_1_percentage,
        sfp_sum,
        sfp_percentage,
        ltm_sum,
        ltm_percentage,
        undecided_2_sum,
        undecided_2_percentage)
as
    select
        rt_district.id,
        rt_district.name,
        rt_municipality.id,
        rt_municipality.name,
        rt_barangay.id,
        rt_barangay.name,
        rt_precinct.id,
        rt_precinct.name,
        rt_leader.id,
        rt_leader.name,
        rt_leader.contact,
        rt_precinct_monitor.respondents,
        rt_precinct_monitor.nac,
        get_percentage(rt_precinct_monitor.nac, rt_precinct_monitor.respondents),
        rt_precinct_monitor.rtt,
        get_percentage(rt_precinct_monitor.rtt, rt_precinct_monitor.respondents),
        rt_precinct_monitor.undecided_1,
        get_percentage(rt_precinct_monitor.undecided_1, rt_precinct_monitor.respondents),
        rt_precinct_monitor.sfp,
        get_percentage(rt_precinct_monitor.sfp, rt_precinct_monitor.respondents),
        rt_precinct_monitor.ltm,
        get_percentage(rt_precinct_monitor.ltm, rt_precinct_monitor.respondents),
        rt_precinct_monitor.undecided_2,
        get_percentage(rt_precinct_monitor.undecided_1, rt_precinct_monitor.respondents)
    from
        rt_precinct
        inner join rt_precinct_monitor
            on (rt_precinct.id = rt_precinct_monitor.precinct_id)
        inner join rt_leader_precinct_assignment as lpa
            on (rt_precinct.id = lpa.precinct_id)
        inner join rt_leader on (lpa.leader_id = rt_leader.id)
        inner join rt_barangay on (rt_precinct.barangay_id = rt_barangay.id)
        inner join rt_municipality
            on (rt_barangay.municipality_id = rt_municipality.id)
        inner join rt_district
            on (rt_municipality.district_id = rt_district.id);
