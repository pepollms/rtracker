DROP TABLE IF EXISTS rt_leader_precinct_assignment;
CREATE TABLE rt_leader_precinct_assignment
(
    id serial NOT NULL,
    precinct_id numeric(10,0) NOT NULL,
    leader_id numeric(10,0) NOT NULL,
    CONSTRAINT rt_leader_precinct_assignment_pkey PRIMARY KEY (id)
);
