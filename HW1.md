1. 
A. Weight: Valid in both
B. WeightKg: Valid in both
C. Weight_Kg: Valid in both
D. Speed-MPH: Valid only in R
E. x321z333: Valid in both
F. 76ers: Valid in neither
G. _var_: Valid only in SAS

2. 
A. Hospital is a valid data set name
B. hospital is a valid data set name
C. data-set is not a valid data set name
D. 100questions is not a valid data set name
E. Demographics_2016 is a valid data set name

3. 
As SAS is not case sensitive, it cannot have variables Score and score.  As R
is case sensitive, it can have both.\

4. 
There are 5 variables and 125 students (assuming no missing values)

5. 
A. You can put more than one SAS statement on a single line is true
B. You can put more than one R statement on a single line is true
C. You can use several lines for a single SAS statement is true
D. You can use several lines for a single R statement is true
E. SAS has three data types: character, numeric, and integer is true.
F. R has three data types: character, numeric, and integer. If you think it’s FALSE, state 2 other data types. Logical, factor
G. In SAS, OPTIONS and TITLE statements are considered global statements is true

6. 
The default storage length for SAS numeric variables is 8 bytes.
The default storage length for R numeric variables is 16 bytes.

7. 
data portfolio;
input ticker $ price shares
value = price*shares
run;

D. My name is Owen Fiore and today's date is 1/30

E. 
portfolio <- data.frame(matrix(nrow=0, ncol = 3))
colnames(portfolio) <- c("Stock", "Price", "Shares")
value = portfolio$Price * portfolio$Shares


8. 
data prob1_8;
   input ID $
         Height /* in inches */
         Weight /* in pounds */
         SBP    /* systolic BP  */
         DBP    /* diastolic BP */;
WtKg = Weight/2.2;
HtCm = Height*2.54;
AveBP = DBP+(SBP-DBP)/3;
HtPolynomial = 2 * Height ** 2+ 1.5*Height**3;
BMI = WtKg/((HtCm/100)**2);
datalines;
001 68 150 110 70
002 73 240 150 90
003 62 101 120 80
;
title "Listing of Problem 8";
proc print data=prob1_8;
run;

Note that some of the spacing had to be changed due to this being a markdown file

9. 
ID <- c(001, 002, 003)
Height <- c(68, 73, 62)
Weight <- c(150, 240, 101)
SBP <- c(110, 150, 120)
DBP <- c(70, 90, 80)
WtKg = Weight/2.2;
HtCm = Height*2.54;
AveBP = DBP+(SBP-DBP)/3;
HtPolynomial = 2 * Height^2+ 1.5*Height^3;
BMI = WtKg/((HtCm/100)^2)
df_1_8 <- data.frame(ID, Height, Weight, SBP, DBP
                     # insert the new variables here
)
cat("Content of the df_1_8 data frame:\n")
df_1_8

10. 
Cannot have the "-" as a data frame

11. 
The following are wrong about the R program: Cannot assign y to be the sum of a
character and integer, cannot assign y to be some math term, one of the
parentheses is incorrect in the read.csv line.


