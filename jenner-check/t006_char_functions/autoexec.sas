/* cap input rows for the captured run */
options obs=100;

/* Mock stand-ins for the course library (pg2) so the character
   functions below operate on real strings. Columns match the reads. */
data pg2_weather_japan;
    infile datalines dsd truncover;
    input Location :$40. Station :$16.;
    datalines;
Tokyo,  Tokyo Prefecture,JP-13-001
Osaka  City , Osaka,JP-27-002
Sapporo , Hokkaido,JP-01-003
Naha,   Okinawa,JP-47-004
;
run;

data pg2_storm_damage;
    infile datalines dsd truncover;
    input Event :$20. Summary :$80. Date :date9. Cost;
    format Date date9.;
    datalines;
Andrew,Made landfall as a Category 5 hurricane in Florida,24AUG1992,27000000000
Katrina,A powerful Category 3 storm at Louisiana landfall,29AUG2005,125000000000
Sandy,Struck as a Category 1 system near New Jersey,29OCT2012,68700000000
Harvey,Stalled Category 4 hurricane over Texas,25AUG2017,125000000000
;
run;

data pg2_storm_final;
    infile datalines dsd truncover;
    input Name :$16. Season StartDate :date9. EndDate :date9.;
    format StartDate EndDate date9.;
    datalines;
Katrina,2005,23AUG2005,31AUG2005
Wilma,2005,15OCT2005,26OCT2005
Sandy,2012,22OCT2012,02NOV2012
Harvey,2017,17AUG2017,02SEP2017
;
run;
