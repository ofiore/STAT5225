
# Question 1
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

The ISBN number is 0374535000 which is for the book: The Improbability Principle: Why Coincidences, Miracles, and Rare Events Happen Every Day

# Question 2
```{r}
int2Roman <- function(x){
  roman <- ""
  while(x >= 1000){
    x <- x-1000
    roman <- paste(roman,"M",sep="")
  }
  while(x >= 900){
    x <- x-900
    roman <- paste(roman,"CM",sep="")
  }
  while(x >= 500){
    x <- x-500
    roman <- paste(roman,"D",sep="")
  }
  while(x >= 400){
    x <- x-400
    roman <- paste(roman,"CD",sep="")
  }
  while(x >= 100){
    x <- x-100
    roman <- paste(roman,"C",sep="")
  }
  while(x >= 90){
    x <- x-90
    roman <- paste(roman,"XC",sep="")
  }
  while(x >= 50){
    x <- x-50
    roman <- paste(roman,"L",sep="")
  }
  while(x >= 40){
    x <- x-40
    roman <- paste(roman,"XL",sep="")
  }
  while(x >= 10){
    x <- x-10
    roman <- paste(roman,"X",sep="")
  }
  while(x >= 9){
    x <- x-400
    roman <- paste(roman,"IX",sep="")
  }
  while(x >= 5){
    x <- x-5
    roman <- paste(roman,"V",sep="")
  }
  while(x >= 4){
    x <- x-4
    roman <- paste(roman,"IV",sep="")
  }
  while(x >= 1){
    x <- x-1
    roman <- paste(roman,"I",sep="")
  }
  return(roman)
}
print(int2Roman(1994))
```
#3
```{r}
fact <- function(num) {
  if (num == 1) {
    return(num)
  }
  return(num * fact(num-1))
}

fact(4)
fact(1)
fact(10)
fact(0)
fact(2.5)
fact(-2)

fact <- function(num) {
  if (num %% 1 !=0){
    return("Enter an integer")
  }
  if (num <= 1) {
    return(num)
  }
  return(num * fact(num-1))
}
fact(4)
fact(1)
fact(10)
fact(0)
fact(2.5)
fact(-2)
fact(1000)/fact(999)
```
# Question 3
data fact;
  do number = 1 to 10;
    if number eq 1 then factorial=1;
    else factorial=factorial*number;
    output;
  end;
run;
proc print data = fact;
run;



# Question 4
```{r}
levenshtein_distance <- function(s1, s2) {
  distances <- matrix(0, nrow = nchar(s1) + 1, ncol = nchar(s2) + 1)
  
  distances[1,] <- 0:nchar(s2)
  distances[,1] <- 0:nchar(s1)
  

  for (i in 2:(nchar(s1) + 1)) {
    for (j in 2:(nchar(s2) + 1)) {
      if (substr(s1, i - 1, i - 1) == substr(s2, j - 1, j - 1)) {
        distances[i,j] <- distances[i-1,j-1]
      } else {
        distances[i,j] <- min(distances[i-1,j], distances[i,j-1], distances[i-1,j-1]) + 1
      }
    }
  }
  return(distances[nchar(s1) + 1, nchar(s2) + 1])
}
levenshtein_distance("kitten", "sitting")
levenshtein_distance("a", "b")
levenshtein_distance("fade", "made")
levenshtein_distance("one", "twentyone")
levenshtein_distance("ninety nine", "ninetynine")
levenshtein_distance("read", "four")
levenshtein_distance("dog", "god")
levenshtein_distance("deriviative", "integral")
levenshtein_distance("bud", "busch")
levenshtein_distance("Germany", "Uruguay")
levenshtein_distance("Afghanistan", "Pakistan")
levenshtein_distance("CT", "C")
levenshtein_distance("Haim", "Bar")
levenshtein_distance("Owen", "Fiore")
levenshtein_distance("Homer", "Babbidge")

```