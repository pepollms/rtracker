DROP TABLE IF EXISTS rt_precinct;
CREATE TABLE rt_precinct
(
    id serial NOT NULL,
    barangay_id numeric(10,0),
    name character varying(50) NOT NULL,
    CONSTRAINT rt_precinct_pkey PRIMARY KEY (id)
);
