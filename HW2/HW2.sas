*Question 1;
data q1;
	input X Y;
Z = 100+ 50*X + 2*X**2 - 25*Y + Y**2;
datalines;
1 2
3 6
5 9
9 11
;
proc print data=q1;
proc contents data=q1;
run;


*Question 3;
data Cache;
infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\geocaching.txt";
input Name $ 1-20
	  LongDeg 21-22
	  LongMin 23-28
	  LatDeg 29-30
	  LatMin 31-36;
run;
proc print data=Cache;
run;

*Question 5A;
filename stockmkt "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\stockprices.txt";
data Stocks;
	infile stockmkt;
	input @ 1 Stock $4.
		  @ 5 PurDate mmddyy10.
		  @ 15 PurPrice dollar6.1
		  @ 21 Number 4.
		  @ 25 SellDate mmddyy10.
		  @ 35 SellPrice dollar6.1;
	run;
proc print data=Stocks;
run;
*Question 5B;
data stockprices3;
   infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\stockprices.txt";
   informat stock $4.
     purdate mmddyy10.
     purprice dollar5.1
     number $3.  
	 selldate mmddyy10.
	 sellprice dollar6.1;
   input @1 stock
         @5 purdate
         @16 purprice
         @21 number
         @25 selldate
         @35 sellprice;
      format purdate selldate mmddyy10.;
run;
*Question 5C;
TotalPur = PurPrice*Number;
TotalSell = Number*SellPrice;
Profit = TotalSell-TotalPur;
*Question 5D;
proc print data=stockprices3;
run;
