##Grade: 3

1. 
D. Speed-MPH: Valid only in R
**[This is invalid in R too because it contains the special character '-']**

5. 
E. SAS has three data types: character, numeric, and integer is true.
**[SAS has only two data types - char and numeric. So it's false]**


7. 
data portfolio;
input ticker $ price shares
value = price*shares
run;
**[Actually, there is a stocks.txt file in data folder. So, ' infile "directory"' statement is missing here.]**

E. 
portfolio <- data.frame(matrix(nrow=0, ncol = 3))
colnames(portfolio) <- c("Stock", "Price", "Shares")
value = portfolio$Price * portfolio$Shares



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
                     # insert the new variables here **[Here you haven't inserted the variable names.]**

)
cat("Content of the df_1_8 data frame:\n")
df_1_8

10. 
**[Others: there is missing semi-colon in lines 2 and 3. There is missing directory name. There is missing operators in line 4.]**

11. 
**[others: missing operator in line 3. missing directory name in line 4.]**

