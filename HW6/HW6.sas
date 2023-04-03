data isbn;
	infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\Data\isbncheck.txt";
	length isbn_str $11;
	input isbn_str$; *This line and the two above it read in the data;

	array isbn_dig[11] $1.;
	do i = 1 to 11;
		isbn_dig[i] = substr(isbn_str, i, 1);
	end;
	isbn_sum = 0;
	do i = 1 to 10;
		if isbn_dig[i] = "X" then isbn_val = 10;
		else isbn_val = input(isbn_dig[i], 1.);
		isbn_sum = isbn_sum + isbn_val*i;
	keychar = isbn_dig[11];
	end;
	drop isbn_dig1-isbn_dig11 i isbn_val;
run;
title "ISBN Numbers";
proc print data = isbn;
run;

data isbn_validity;
	set isbn;
	if mod(isbn_sum, 11) eq 0 then output;
title1 "Valid ISBN numbers";
title2 "The last digit of the ISBN numbers is for the scavenger hunt";
footnote "This list represents the 10 valid ISBN numbers";
proc print data=isbn_validity;
run;

data finalisbn(keep=isbnstr);
	set isbn_validity end=eof;
	length isbnstr $10.;
	retain isbnstr;
	isbnstr = cats(isbnstr, keychar);
	if eof then output;
run;

ods pdf file= "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\Data\HW6_Fiore";
title "Final ISBN string";
footnote;
proc print data = finalisbn noobs;
run;
ods pdf close;
