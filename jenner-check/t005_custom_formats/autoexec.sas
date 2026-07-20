/* cap input rows for the captured run */
options obs=100;

/* Mock stand-ins for the course library (pg2) so the custom formats
   below apply to real rows. Columns match what each step reads. */
data pg2_class_birthdate;
    infile datalines dsd truncover;
    input Name :$12. Registration :$1. Height Age;
    datalines;
Amir,C,61.2,12
Bethany,I,63.8,12
Carlos,C,58.5,12
Diana,C,53.0,12
Ethan,I,68.0,13
Fiona,C,60.5,12
;
run;

data pg2_np_acres;
    infile datalines dsd truncover;
    input ParkName :$28. GrossAcres;
    datalines;
Acadia,49075
Grand Canyon,1201647
Yellowstone,2219791
Gateway Arch,192
Zion,147242
Great Basin,77180
;
run;
