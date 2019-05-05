select
    array_to_json(array_agg(row_to_json(t)))
from (
    select
        municipality_id,
        municipality,
        barangay_id,
        barangay,
        to_char(respondents_sum, 'FM999,999') as total_respondents,
        to_char(nac_sum, 'FM999,999') as total_nac,
        to_char(nac_percentage, 'FM999') as percentage_nac,
        to_char(rtt_sum, 'FM999,999') as total_rtt,
        to_char(rtt_percentage, 'FM999') as percentage_rtt,
        to_char(undecided_1_sum, 'FM999,999') as total_undecided_1,
        to_char(undecided_1_percentage, 'FM999') as percentage_undecided_1,
        to_char(sfp_sum, 'FM999,999') as total_sfp,
        to_char(sfp_percentage, 'FM999') as percentage_sfp,
        to_char(ltm_sum, 'FM999,999') as total_ltm,
        to_char(ltm_percentage, 'FM999') as percentage_ltm,
        to_char(undecided_2_sum, 'FM999,999') as total_undecided_2,
        to_char(undecided_2_percentage, 'FM999') as percentage_undecided_2
    from
        view_barangay
    order by
        municipality,
        barangay
    ) t;
