update vt_precinct_monitor
set respondents = s.respondents,
    nac = s.nac,
    rtt = s.rtt,
    undecided_1 = s.undecided_1,
    sfp = s.sfp,
    ltm = s.ltm,
    undecided_2 = s.undecided_2
from
    view_import_current s
where
    vt_precinct_monitor.precinct_id = s.precinct_id;
