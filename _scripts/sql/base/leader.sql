DROP TABLE IF EXISTS rt_leader;
CREATE TABLE rt_leader
(
    id serial NOT NULL,
    name character varying(50) NOT NULL,
    contact character varying(50) NOT NULL,
    CONSTRAINT rt_leader_pkey PRIMARY KEY (id)
);
