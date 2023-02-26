data school;
	input Age Quiz : $1. Midterm Final;
	if Age eq 12 then Grade=6;
	else if Age eq 13 then Grade=8;
	if Quiz eq 'A' then Course = .2*95+.3*Midterm+.5*Final;
	else if Quiz eq 'B' then Course = .2*85+.3*Midterm+.5*Final;
	else if Quiz eq 'C' then Course = .2*75+.3*Midterm+.5*Final;
	else if Quiz eq 'D' then Course = .2*70+.3*Midterm+.5*Final;
	else if Quiz eq 'F' then Course = .2*65+.3*Midterm+.5*Final;
	select;
		when (97 le Course AND Course le 100) FinalGrade = 'A+';
		when (93 le Course AND Course lt 97) FinalGrade = 'A';
		when (90 le Course AND Course lt 93) FinalGrade = 'A-';
		when (87 le Course AND Course lt 90) FinalGrade = 'B+';
		when (83 le Course AND Course lt 87) FinalGrade = 'B';
		when (80 le Course AND Course lt 83) FinalGrade = 'B-';
		when (77 le Course AND Course lt 80) FinalGrade = 'C+';
		when (73 le Course AND Course lt 77) FinalGrade = 'C';
		when (70 le Course AND Course lt 73) FinalGrade = 'C-';
		when (67 le Course AND Course lt 70) FinalGrade = 'D+';
		when (63 le Course AND Course lt 67) FinalGrade = 'D';
		when (60 le Course AND Course lt 63) FinalGrade = 'D-';
		when (0 le Course AND Course lt 60) FinalGrade = 'F';
		otherwise;
	*if FinalGrade eq 'F' then STATUS ="FAILED";
datalines;
12 A 92 95
12 B 88 88
13 C 78 75
13 A 92 93
12 F 55 50
13 B 88 82
;
run;
proc print data=school;
run;
*2;
data Sales;
	infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\Sales.csv" dsd;
	input ID Name $ Region $ Customer $ Item $ Quantity UnitCost TotalSales;
run;
data sale;
	set Sales;
	if Name = "Name" then delete;
run;
*2A;
proc print data=sale;
	where Region eq "North" and Quantity lt 60 and not missing(Quantity);
run;
*2B;
proc print data=sale;
	where (Region eq "North" and Quantity lt 60 and not missing(Quantity)) or
		(ID eq 177) or (Customer eq "Pet's ar");
run;
*2C;
proc print data=sale;
	where (Name eq "Jason Nu" and Region eq "East") or (Name not eq "George S" and Region eq "West");
run;
*2D   I don't understand what this question was asking;
proc print data=sale;
	where missing(Quantity);
run;

*5A;
data log;
	do N = 1 to 20;
		LogN = log(N);
		output;
	end;
run;
proc print data=log noobs;
run;
*5B;
data log;
	do N = 5 to 100 by 5;
		LogN = log(N);
		output;
	end;
run;
proc print data=log noobs;
run;

*7;
data quad;
	do x = 0 to 10 by 0.10;
		y = 3*x**2 - 5*x + 10;
		output;
	end;
run;
proc gplot data=quad;
	plot y * x;
run;

*8;
data logit;
	do p = 0 to 1 by 0.05;
		prob = log(p/(1-p));
		output;
	end;
run;
proc gplot data=logit;
	plot prob*p;
run;

*10;
data Temperatures;
	do day = "Mon", "Tue", "Wed", "Thu", "F", "S", "S";
		input Temp @;
		output;
	end;
datalines;
70 72 74 76 77 78 85
;
run;
proc print data=Temperatures noobs;
run;

*11;
data compound;
	Money = 1000;
	Int = 1.0425;
	Month = 0;
	do while Money lt 30000;
		Total + Interest*Total;
		Month + 1;
		output;
	end;
run;

*13;
data squares;
	x = 0;
	do until (x**2 gt 100);
		x + 1;
		squared = x**2;
		output;
	end;
run;
proc print data=squares noobs;
run;


		



