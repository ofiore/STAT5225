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
	length str $11;
	input str$;
run;


data isbn_integer;
	set isbn;
	length num $10;
	num = translate(str, '', 'X');
	do i = 1 to length(num);
		sum = sum + input(substr(num, i, 1), 1.)* (11-i);
	end;
	drop i num;
run;
proc print data = isbn_integer;
run;

data check;
	set isbn_integer;
	remainder = mod(sum, 11);
	check_digit = mod(11 - remainder, 11);
	check_digit_char = ifn(check_digit=10, "X", put(check_digit,1.));
run;
proc print data=check;
run;

data test;
  set isbn;
  length isbn_str_new $13;
  isbn_str_new = compress(str, '-');
  do i=1 to 10;
    if substr(isbn_str_new, i, 1) = 'X' then
      isbn_int = isbn_int + 10 * (11-i);
    else
      isbn_int = isbn_int + input(substr(isbn_str_new, i, 1), 1.) * (11-i);
  end;
  drop i isbn_str;
run;
proc print data=test;
run;
