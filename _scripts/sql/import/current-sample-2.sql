\COPY rt_import_current( municipality_code, precinct, nac, rtt, sfp, ltm) FROM '../_data/to_import/current/current-sample-2.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';
