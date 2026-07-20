/* Conditional Processing */
*using if and else and length statements so the words dont get cropped;
data park_type;
	set pg1_np_summary;
	length ParkType $ 8;
	if Type='NM' then ParkType='Monument';
	else if Type='NP' then ParkType='Park';
	else if Type in ('NPRE', 'PRE', 'PRESERVE') then ParkType='Preserve';
	else if Type='NS' then ParkType='Seashore';
	else if Type in ('RVR', 'RIVERWAYS') then ParkType='River';
run;

proc freq data=park_type;
	tables ParkType;
run;
