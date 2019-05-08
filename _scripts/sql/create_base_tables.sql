-- Create base tables

-- Drop view dependencies
-- The following views must be dropped prior to creating any base tables
-- remove dependencies. Although `drop <table> cascade` performs the same
-- operation, the following was opted for now.
drop view if exists view_rt_districts_per_province;
drop view if exists view_rt_municipalities_per_district;
drop view if exists view_rt_barangays_per_municipality;
drop view if exists view_rt_precincts_per_barangay;
drop view if exists view_rt_province;
drop view if exists view_rt_district;
drop view if exists view_rt_municipality;
drop view if exists view_rt_barangay;
drop view if exists view_rt_precinct;
--drop view if exists view_team;

drop view if exists view_rt_import_current;

\ir ./base/utility.sql

\ir ./base/import.sql
\ir ./base/import_current.sql

\ir ./base/region.sql
\ir ./base/province.sql
\ir ./base/district.sql
\ir ./base/municipality.sql
\ir ./base/barangay.sql
\ir ./base/precinct.sql
--\ir ./base/team.sql

\ir ./base/leader.sql
\ir ./base/leader_precinct_assignment.sql
\ir ./base/precinct_monitor.sql


