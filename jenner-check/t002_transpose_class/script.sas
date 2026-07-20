/*Using Transpose*/

proc print data=sashelp.class;
run;

proc transpose data=sashelp.class out=class_t;
     id Name;
     var Height Weight;
run;
