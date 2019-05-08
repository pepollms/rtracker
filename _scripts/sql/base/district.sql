DROP TABLE IF EXISTS rt_district;
CREATE TABLE rt_district
(
    id serial NOT NULL,
    province_id numeric(10, 0) NOT NULL,
    name character varying(50) NOT NULL,
    CONSTRAINT rt_district_pkey PRIMARY KEY (id)
);
