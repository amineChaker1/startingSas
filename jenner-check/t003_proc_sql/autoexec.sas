/* cap input rows for the captured run */
options obs=100;

/* Mock stand-ins for the course library (pg1) so the PROC SQL below
   runs in isolation. Column names/types match what the query reads. */
data pg1_class_birthdate;
    infile datalines dsd truncover;
    input Name :$12. Age Height Birthdate :date9.;
    format Birthdate date9.;
    datalines;
Amir,13,61.2,03MAR2011
Bethany,14,63.8,17JUN2010
Carlos,12,58.5,22NOV2012
Diana,11,53.0,08FEB2013
Ethan,15,68.0,30AUG2009
Fiona,13,60.5,14JAN2011
;
run;

data pg1_storm_damage;
    infile datalines dsd truncover;
    input Event :$24. Cost Date :date9.;
    format Date date9.;
    datalines;
Hurricane Andrew,27000000000,24AUG1992
Hurricane Katrina,125000000000,29AUG2005
Hurricane Harvey,125000000000,25AUG2017
Hurricane Sandy,68700000000,29OCT2012
Hurricane Ike,30000000000,13SEP2008
Hurricane Ivan,20500000000,16SEP2004
;
run;
