\COPY vt_import_current( municipality_code, precinct, nac, rtt, sfp, ltm) FROM '../_data/to_import/current/current-sample.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';
