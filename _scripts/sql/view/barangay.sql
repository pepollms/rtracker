drop view if exists view_barangay;
create or replace view view_barangay
    (district_id,
        district,
        municipality_id,
        municipality,
        barangay_id,
        barangay,
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
        district_id,
        district,
        municipality_id,
        municipality,
        barangay_id,
        barangay,
        sum(respondents_sum) respondents,
        sum(nac_sum) as nac_sum,
        get_percentage(sum(nac_sum), sum(respondents_sum)),
        sum(rtt_sum) as rtt_sum,
        get_percentage(sum(rtt_sum), sum(respondents_sum)),
        sum(undecided_1_sum) as undecided_1_sum,
        get_percentage(sum(undecided_1_sum), sum(respondents_sum)),
        sum(sfp_sum) as sfp_sum,
        get_percentage(sum(nac_sum), sum(respondents_sum)),
        sum(ltm_sum) as ltm_sum,
        get_percentage(sum(rtt_sum), sum(respondents_sum)),
        sum(undecided_2_sum) as undecided_2_sum,
        get_percentage(sum(undecided_1_sum), sum(respondents_sum))
    from
        view_precinct
    group by
        district_id,
        district,
        municipality_id,
        municipality,
        barangay_id,
        barangay
    order by
        district,
        municipality,
        barangay;
