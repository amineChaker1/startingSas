/* cap input rows for the captured run */
options obs=100;

/* Mock stand-in for the course library (pg1) so the conditional
   processing below runs on real rows. Columns match what is read. */
data pg1_np_summary;
    infile datalines dsd truncover;
    input Reg :$4. ParkName :$28. Type :$10. DayVisits OtherLodging
          BackcountryCampers OtherCamping RVCampers TentCampers;
    datalines;
PW,Yosemite,NP,4586000,120000,25000,4000,60000,90000
IM,Zion,NP,4500000,80000,5000,2000,30000,70000
SE,Congaree,NM,159000,0,1200,300,0,4500
PW,Muir Woods,NM,900000,0,0,0,0,0
NE,Acadia,NP,3437000,45000,3000,1000,20000,50000
MW,Effigy Mounds,NM,60000,0,200,100,0,900
AK,Katmai,PRE,37000,0,800,200,0,1500
IM,Dinosaur,NM,300000,0,1500,400,0,3000
;
run;
