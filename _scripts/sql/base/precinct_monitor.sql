DROP TABLE IF EXISTS vt_precinct_monitor;
CREATE TABLE vt_precinct_monitor
(
    id serial NOT NULL,
    precinct_id numeric(10,0) NOT NULL,
    respondents numeric(10,0) NOT NULL DEFAULT 0,
    nac numeric(10,0) NOT NULL DEFAULT 0,
    rtt numeric(10,0) NOT NULL DEFAULT 0,
    undecided_1 numeric(10,0) NOT NULL DEFAULT 0,
    sfp numeric(10,0) NOT NULL DEFAULT 0,
    ltm numeric(10,0) NOT NULL DEFAULT 0,
    undecided_2 numeric(10,0) NOT NULL DEFAULT 0,
    CONSTRAINT vt_precinct_monitor_pkey PRIMARY KEY (id)
);
