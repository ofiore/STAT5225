*Question 1;
data Employ;
informat ID $3.
		 Name $20.
		 Depart $8.
		 DateHire mmddyy10.
		 Salary dollar8.;
infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\Data\employee.csv" dsd;
input ID
	  Name
	  Depart
	  DateHire
	  Salary;
format DateHire mmddyy10. Salary dollar8.;
run;
proc print data=Employ;
run;

title "Frequency Distribution of Departments";
proc freq data=Employ;
	tables Depart;
run;

*Question 3a;
data Voter;
input col1 col2 $ col3-col6;
label col1 = "Age"
	  col2 = "Party"
	  col3 = "The president is doing a good job"
	  col4 = "Congress is doing a good job"
	  col5 = "Taxes are too high"
	  col6 = "Government should cut spending";
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3
57 R 4 3 4 4
;
run;
proc print data=Voter;
run;

*Question 3b;
libname hw3 "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents";
proc format library=hw3;
	value age 0-<30 = "Less than 31"
			  31-<50 = "31 to 50"
			  51-<70 = "51 to 70"
			  71-high = "Older than 70";
	value $Party "D" = "Democrat"
				 "R" = "Republican";
	value $likert 1 = "Strongly Disagree"
				  2 = "Disagree"
				  3 = "No opinion"
				  4 = "Agree"
				  5 = "Strongly Agree"
run;
*Part C: I changed the operators in the Age inequality statement to work with decimals.;
*Part D;
proc format;
	value $likert "1","2" = "Generally Disagree"
				  "3" = "No opinion"
				  "4","5" = "Agreement";
run;
proc freq data=Voter;
title "Question Frequencies";
tables col3-col6;
format col3-col6 $likert.;
run;


*Problem 4;
data colors;
	input Color : $1. @@;
	if Color in ("R", "G", "B") then Group = 1;
	else if Color in ("Y", "O") then Group = 2;
	else if missing(Color) then Group = "Not Given";
	else Group = 3;
datalines;
R R B G Y Y . . B G R B G Y P O O V V B
;
proc freq data=colors;
run;

*Problem 5;
title "Format Definitions in the HW3 Library";
proc format library=HW3 fmtlib;
run;
			




