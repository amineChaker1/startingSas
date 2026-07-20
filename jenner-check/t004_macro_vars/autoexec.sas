/* cap input rows for the captured run */
options obs=100;

/* Mock stand-ins for the course library (pg1) so the macro-variable
   driven WHERE clauses below run in isolation. Columns match the reads. */
data pg1_storm_summary;
    infile datalines dsd truncover;
    input Basin :$2. Name :$16. StartDate :date9. EndDate :date9. MaxWindMPH MinPressure;
    format StartDate EndDate date9.;
    datalines;
NA,Katrina,23AUG2005,31AUG2005,175,902
NA,Wilma,15OCT2005,26OCT2005,185,882
NA,Rita,18SEP2005,26SEP2005,180,895
NA,Andrew,16AUG1992,28AUG1992,175,922
WP,Haiyan,03NOV2013,11NOV2013,195,895
NA,Irma,30AUG2017,12SEP2017,180,914
NA,Dorian,24AUG2019,07SEP2019,185,910
SI,Gafilo,01MAR2004,14MAR2004,160,895
;
run;

data pg1_np_species;
    infile datalines dsd truncover;
    input Species_ID :$16. Category :$12. Abundance :$12. Conservation_Status :$16.;
    datalines;
ZION-1001,Bird,Common,
ZION-1002,Bird,Uncommon,Species of Concern
ZION-1003,Mammal,Rare,Endangered
ZION-1004,Bird,Abundant,
BRCA-2001,Bird,Common,
ZION-1005,Bird,Rare,Threatened
;
run;
