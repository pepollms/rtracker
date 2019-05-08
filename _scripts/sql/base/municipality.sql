DROP TABLE IF EXISTS rt_municipality;
CREATE TABLE rt_municipality
(
    id serial NOT NULL,
    district_id numeric(10,0) NOT NULL,
    name character varying(50) NOT NULL,
    CONSTRAINT rt_municipality_pkey PRIMARY KEY (id)
);
