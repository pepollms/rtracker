DROP TABLE IF EXISTS rt_province;
CREATE TABLE rt_province
(
    id serial NOT NULL,
    region_id character varying(10),
    code character varying(10),
    name character varying(50) NOT NULL,
    aka character varying(50),
    CONSTRAINT rt_province_pkey PRIMARY KEY (id)
);
