drop view if exists view_rt_province;
create or replace view view_rt_province
    (respondents_sum,
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
        sum(respondents_sum) respondents,
        sum(nac_sum) as nac_sum,
        get_percentage(sum(nac_sum), sum(respondents_sum)),
        sum(rtt_sum) as rtt_sum,
        get_percentage(sum(rtt_sum), sum(respondents_sum)),
        sum(undecided_1_sum) as undecided_1_sum,
        get_percentage(sum(undecided_1_sum), sum(respondents_sum)),
        sum(sfp_sum) as sfp_sum,
        get_percentage(sum(sfp_sum), sum(respondents_sum)),
        sum(ltm_sum) as ltm_sum,
        get_percentage(sum(ltm_sum), sum(respondents_sum)),
        sum(undecided_2_sum) as undecided_2_sum,
        get_percentage(sum(undecided_1_sum), sum(respondents_sum))
    from
        view_rt_precinct;
