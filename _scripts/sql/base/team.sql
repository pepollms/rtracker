DROP TABLE IF EXISTS vt_team;
CREATE TABLE vt_team
(
    id serial NOT NULL,
    name_1 character varying(50) NOT NULL,
    name_2 character varying(50) NOT NULL,
    CONSTRAINT vt_team_pkey PRIMARY KEY (id)
);
