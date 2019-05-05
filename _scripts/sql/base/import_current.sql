DROP TABLE IF EXISTS vt_import_current;
CREATE TABLE vt_import_current
(
    id serial NOT NULL,
    municipality_code numeric(10) NOT NULL,
    precinct character varying(10) NOT NULL,
    nac numeric(10,0) NOT NULL DEFAULT 0,
    rtt numeric(10,0) NOT NULL DEFAULT 0,
    undecided_1 numeric(10,0) NOT NULL DEFAULT 0,
    sfp numeric(10,0) NOT NULL DEFAULT 0,
    ltm numeric(10,0) NOT NULL DEFAULT 0,
    undecided_2 numeric(10,0) NOT NULL DEFAULT 0,
    imported_when timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT vt_import_current_pkey PRIMARY KEY (id)
);
