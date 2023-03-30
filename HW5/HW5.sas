data fact;
  do number = 1 to 10;
    if number eq 1 then factorial=1;
    else factorial=factorial*number;
    output;
  end;
run;
proc print data = fact;
run;

data isbn;
	infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\Data\isbncheck.txt";
	length isbn_str $11;
	input isbn_str$; *This line and the two above it read in the data;
  	isbn_sum = 0; *Initializes variable that will eventually be added to;
  	do i=1 to 10; *Loop through the string;
    	if substr(isbn_str, i, 1) = 'X' then isbn_val = 10; *Checks to see if the string contains X and then isbn_val = 10;
    	else isbn_val = input(substr(isbn_str, i, 1), 1.); *Checks for the other numbers in the string;
		isbn_sum = isbn_sum + isbn_val*i; *Adds the running total of the sum to the character value * character position;
  end;
  drop isbn_val i; *Drop non-needed variables;
run;
proc print data=isbn;
run;

data scavenger;
	set isbn;
	if mod(isbn_sum, 11) eq 0 then isbn_num = "T"; *Checks to see if the isbn_sum is divisible by 10.  If is is, then it is a valid ISBN number;
	else isbn_num = "F"; *Sets any number not divisible by 11 to F, indicating it is not a valid ISBN number;
	where isbn_num = "T";
run;
proc print data = scavenger;
run;

data hunt;
	set scavenger;
	last = substr(isbn_str, 11, 1); *Get the last number,;
	where isbn_num = "T"; *for the valid isbn numbers
run;
proc print data=hunt noobs;
var last; *View just the last variable;
run;

ods pdf file= "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\HW5_Fiore";
proc print data = scavenger;
run;
proc print data = hunt;
title "Last column for the 10 true ISBN values";
var isbn_str isbn_num last;
run;
ods pdf close;




