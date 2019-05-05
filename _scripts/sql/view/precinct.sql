drop view if exists view_precinct;
create or replace view view_precinct
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
        vt_district.id,
        vt_district.name,
        vt_municipality.id,
        vt_municipality.name,
        vt_barangay.id,
        vt_barangay.name,
        vt_precinct.id,
        vt_precinct.name,
        vt_leader.id,
        vt_leader.name,
        vt_leader.contact,
        vt_precinct_monitor.respondents,
        vt_precinct_monitor.nac,
        get_percentage(vt_precinct_monitor.nac, vt_precinct_monitor.respondents),
        vt_precinct_monitor.rtt,
        get_percentage(vt_precinct_monitor.rtt, vt_precinct_monitor.respondents),
        vt_precinct_monitor.undecided_1,
        get_percentage(vt_precinct_monitor.undecided_1, vt_precinct_monitor.respondents),
        vt_precinct_monitor.sfp,
        get_percentage(vt_precinct_monitor.nac, vt_precinct_monitor.respondents),
        vt_precinct_monitor.ltm,
        get_percentage(vt_precinct_monitor.rtt, vt_precinct_monitor.respondents),
        vt_precinct_monitor.undecided_2,
        get_percentage(vt_precinct_monitor.undecided_1, vt_precinct_monitor.respondents)
    from
        vt_precinct
        inner join vt_precinct_monitor
            on (vt_precinct.id = vt_precinct_monitor.precinct_id)
        inner join vt_leader_precinct_assignment as lpa
            on (vt_precinct.id = lpa.precinct_id)
        inner join vt_leader on (lpa.leader_id = vt_leader.id)
        inner join vt_barangay on (vt_precinct.barangay_id = vt_barangay.id)
        inner join vt_municipality
            on (vt_barangay.municipality_id = vt_municipality.id)
        inner join vt_district
            on (vt_municipality.district_id = vt_district.id);
