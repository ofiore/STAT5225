# Homework 2
## STAT/BIST 5225

**Due Date: February 5, 2023 (by 23:59, on your own github repo)**


1. **SAS**: Create a permanent data set that uses a DATALINES statement to read in values for X and Y. In the DATA step, you want to create a new variable, Z, equal to 100 + 50 X + 2X^2 - 25Y + Y^2. Use the following (X, Y) data pairs: (1, 2), (3, 6), (5, 9) and (9, 11). View this data set using PROC CONTENTS and PROC PRINT


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





2. **R**: Repeat question 1 in R. 
a. Create a matrix to save (X, Y) values, calculate Z, and save the matrix which contains the columns X,Y,Z into an Rdata file.
b. Create a data frame to save (X, Y) values, calculate Z, save the data frame which contains the columns X,Y,Z into an Rdata file.
c. Create one list to save (X, Y) values, and calculate Z, and save the workspace.
d. Load the Rdata you saved in part b, and view this data frame using str().



X <- c(1, 3, 5, 9)
Y <- c(2, 6, 9, 11)
q2_matrix <- matrix(c(X, Y), nrow = 4, byrow=FALSE, ncol = 2)
colnames(q2_matrix) <- c("X", "Y")
q2_matrix
Z <- 100 + 50*q2_matrix[,1] + 2*(q2_matrix[,1]**2) - 25*q2_matrix[,2] + q2_matrix[,2]**2
q2_matrix <- cbind(q2_matrix, Z)


q2_df <- data.frame(X,Y,Z)


q2_lst <- list(X = c(1,3,5,9), Y = c(2,6,9,11))
Z <- 100 + 50*q2_lst$X + 2*(q2_lst$X**2) - 25*q2_lst$Y + q2_lst$Y**2
q2_lst$Z <- Z
q2_lst

str(q2_df)




3. **SAS**: You have a text file called geocaching.txt with data values arranged as follows:

Variable |	Description |	Starting Column	| Ending Column	| Data Type
---|---|---|---|---
Name	| Cache name |	1	| 20	| Char
LongDeg	| Longitude degrees	| 21	| 22	| Num
LongMin	| Longitude minutes	| 23	| 28	| Num
LatDeg	| Latitude degrees	| 29	| 30	| Num
LatMin	| Latitude minutes	| 31	| 36	| Num


Here's a listing of the file:

```
Higgensville Hike   4030.2937446.539
Really Roaring      4027.4047442.147
Cushetunk Climb     4037.0247448.014
Uplands Trek        4030.9907452.794
```
Create a temporary SAS data set called Cache using this data file. Use column input to read the data values.


data Cache;
infile "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\geocaching.txt";
input Name $ 1-20
	  LongDeg 21-22
	  LongMin 23-28
	  LatDeg 29-30
	  LatMin 31-36;
run;



4. **R**: Read the geocaching.txt file into a data frame.


cat("\n", file = "../STAT5225/Data/geocaching.txt", append = TRUE)
cache <-read.fwf("../STAT5225/Data/geocaching.txt", widths = c(20,2,6,2,6), col.names=c("Name", "LongDeg", "LongMin", "LatDeg", "LatMin"))
str(cache)


5. **SAS**: You are given a text file called stockprices.txt containing information on the purchase and sale of stocks. The data layout is as follows.

Variable	| Description	| Starting Column	| Length	| Data Type
---|---|---|---|---
Stock	| Stock symbol	| 1	| 4	| Char
PurDate	| Purchase date	| 5	| 10	| mm/dd/yyyy
PurPrice	| Purchase price	| 15	| 6	| Dollar signs and commas
Number	| Number of shares	| 21	| 4	| Num
SellDate	| Selling date	| 25	| 10	| mm/dd/yyyy
SellPrice	| Selling price	| 35	| 6	| Dollar signs and commas

A listing of the data file is:

```
IBM  5/21/2006 $80.0 10007/20/2006 $88.5
CSCO04/05/2005 $17.5 20009/21/2005 $23.6
MOT 03/01/2004 $14.7 50010/10/2006 $19.9
XMSR04/15/2006 $28.4 20004/15/2006 $12.7
BBY 02/15/2005 $45.2 10009/09/2006 $56.8
```

a. Create a SAS data set (call it Stocks) by reading the data from the file. Use a FILENAME statement to create a fileref instead of using the file name on the INFILE statements. Use formatted input.

filename stockmkt "\\msfs-03.grove.ad.uconn.edu\home\Omf19002\Documents\stockprices.txt";
data Stocks;
	infile stockmkt;
	input @ 1 Stock $4.
		  @ 5 PurDate mmddyy10.
		  @ 15 PurPrice $6.
		  @ 21 Number 4.
		  @ 25 SellDate mmddyy10.
		  @ 35 SellPrice $6.;
	run;



b. Repeat part (a) with List Input using INFORMAT.

data Stocks2;
	informat Stock $4.
			 PurDate mmddyy10.
			 PurPrice $6.
			 Number 5.
			 SellDate mmddyy10.
			 SellPrice $6.;
	infile stockmkt;
	input Stock
		  PurDate
		  PurPrice
		  Number
		  SellDate
		  SellPrice;
	run;
proc print data = Stocks2;
run;

c. Compute several new variables as follows:

Variable	| Description	| Computation
---|---|---
TotalPur	| Total purchase | price	Number times PurPrice
TotalSell	| Total selling price	| Number times Sell Price
Profit	| Profit	| TotalSell minus TotalPur



TotalPur = PurPrice*Number;
		  TotalSell = Number*SellPrice;
		  Profit = TotalSell-TotalPur;


d. Print out the contents of this data set using PROC PRINT.

proc print data=Stocks;


6. **R**: You are given a text file called stockprices_r.txt containing information on the purchase and sale of stocks. The data layout is as follows.


Variable	| Description
---|---
Stock	| Stock symbol
PurDate	| Purchase date
PurPrice	| Purchase price
Number	| Number of shares
SellDate	| Selling date
SellPrice	| Selling price


A listing of the data file is:

```
IBM	5/21/2006	8000.0	1000	07/20/2006	88.5
CSCO	04/05/2005	1700.5	2000	09/21/2005	23.6
MOT	03/01/2004	1400.7	5000	10/10/2006	19.9
XMSR	04/15/2006	2800.4	2000	04/15/2006	12.7
BBY	02/15/2005	4500.2	1000	09/09/2006	56.8
```

a. Create a data frame by reading the data from the file. Choose your own column names.

mkt <-read.csv("../STAT5225/Data/stockprices_r.txt", header = FALSE, sep = "\t")
colnames(mkt) <- c("Stock", "PurchaseDate", "PurchasePrice", "NumShares", "SellDate", "SellPrice")


b. Repeat question 5c, calculate all 3 variables and save them into a list.



mkt$TotalPurhase <- mkt$PurchasePrice*mkt$NumShares
mkt$TotalSell <- mkt$NumShares*mkt$SellPrice
mkt$Profit <- mkt$TotalSell - mkt$TotalPur
blst <- list(mkt$TotalPurhase, mkt$TotalSell, mkt$Profit)


c. Print out a sentence like the following: (use the paste function)
IBM is bought at $8,000 on 2006-05-21.


print(paste(mkt$Stock, "is bought at", paste("$",prettyNum(mkt$PurchasePrice,big.mark = ",", sep ="")), "on", mkt$PurchaseDate))



7. **R**: You are given a text file called bankdata_r.txt. The data layout is as follows.

Variable	|Starting Column	| Length	| Data Type
---|---|---|---
Name	| 1	| 14	| Char
Gender	| 15	| 1	| Factor
ID	| 16	| 5	| Char
Balance	| 21	| 8	| Num
Credit History	| 29	|4	|Ordinal

Here's a listing of file:
```
Philip Jones  MV123414322.32GOOD
Nathan PhilipsFV139915202.45GOOD
Shu Lu        FW889251233.45GOOD
Betty Boop    MV767750002.78MED
```
a. Create a data frame by reading the data from the file. Skip the first person, choose your own column names. Save the data as the type listed in the above table.


bank <- suppressWarnings(read.fwf("../STAT5225/Data/bankdata_r.txt", widths = c(14, 1, 5, 8, 4), col.names = c("Name", "Gender", "ID", "Balance", "CreditHistory"), skip = 1, n = 3))


b. View this data set using str().


str(bank)