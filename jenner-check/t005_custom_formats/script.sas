/*Creating Custom Formats*/

*character and numeric custom formats;
proc format;
    value $regfmt 'C'='Complete'
                  'I'='Incomplete';
    value hrange 50-57='Below Average'
                 58-60='Average'
                 61-70='Above Average';
run;

proc print data=pg2_class_birthdate noobs;
    where Age=12;
    var Name Registration Height;
    format Registration $regfmt. Height hrange.;
run;

*limting ranges with numeric;
proc format;
    value psize low-<10000='Small'
                10000-<500000='Average'
                500000-high='Large';
run;

data np_parksize;
    set pg2_np_acres;
    ParkSize=put(GrossAcres, psize.);
    format GrossAcres comma16.;
run;

proc print data=np_parksize noobs;
run;
