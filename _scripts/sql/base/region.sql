DROP TABLE IF EXISTS rt_region;
CREATE TABLE rt_region
(
    id serial NOT NULL,
    code character varying(10),
    name character varying(50) NOT NULL,
    aka character varying(50),
    abbreviation character varying(20),
    CONSTRAINT rt_region_pkey PRIMARY KEY (id)
);
