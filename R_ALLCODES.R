
# R Basics

# 1 Raise 12 to the second power
12^2
12**2
# 2 Find the square root of 169.
169^.5
169**.5
sqrt(169)

# 3 Raise  1/8 to the third power
(1/8)**3         
(1/8)^3
(1/8)*(1/8)*(1/8)

# 4 Evaluate 6 times the difference between between the square of 5 and 3.
6*(5^2 - 3)

# 5 Evaluate log(1000)   (common log,  base 10)
log10(1000)   

# 6 Evaluate ln(1000)    (Natural log,  base e)
log(1000)


# 7 Write all integers 1 to 25 inclusive in ascending order

1:25

# 8 Write all integers 1 to 25 inclusive in descending order

25:1

# 9 Find the sum of all integers 1 to 25. 

sum(1:25)

# 10 Find the mean of all integers 1 to 25. 

mean(1:25)

# 11 Find the median of all integers 1 to 25. 

median(1:25)

# 12 Find the mean, median, and other statistical indicators

summary(1:25)

# 13 Round 7.2557 to the nearest tenth

round(7.2557, digits= 1)


# 14 Round 7.2557 to the nearest thousandths

round(7.2557, digits= 3)

# 15 Divide  16 by 8

16/8

# 16 Divide 1 by 7 and then round the answer t0 the nearest  hundredth (use one line of code)

round((1/7),  digits = 2)

# 17  Find the numerical approximation for pi.   (We should get  3.141593)

pi

#VECTOR  USAGE

# 18  Create a vector to find the mean of a set of numbers.  Find the mean of 17 , 6, 10, 12
x <- c(7,6,10,12)
x

mean(x)


# 19  Create a vector to find the median of a set of numbers.  Find the median of 17 , 6, 10, 12

x <- c(7,6,10,12)
x

median(x)


# 20   Create a vector to find the 1st and third quartiles value of a set of numbers.  
# Find the 1st and 3rd quartiles of the numbers 17 , 6, 10, 12

x <- c(7,6,10,12)
x

summary(x)


# Using R to write a function

# 21  Write a function  to find the area of a square.   ( A =  s^2)

A <- function(s)
{s^2
  return(s^2)
}
# Find the area of a square whose sides are 12 inches
A(12)


#22  Write a function to find simple interest   (I = prt)

I <- function(p,r,t)
{p*r*t
  return(p*r*t)
}
# Find simple interest if $200 is invested at 5% for 2 years.
I(200,.05, 2)


#23  Use R code to write a function that calculate a weighted average if chapter exams account for 40% of your grade,
# homework accounts for 30% of your grade,  classwork accounts for 10% of your grade, and the final exam
# accounts for 20% of your grade.   (WA  = .40CE + .30HW  +  .10CW + .20FE)
WA <- function(CE,HW,CW,FE)
{.40*CE + .30*HW + .10*CW + .20*FE
  return(.40*CE + .30*HW + .10*CW + .20*FE)
}
# Now find the weighted if a student has a chapter exam average of 80, a homework average of 84, a classwork
# average of 76, and a final exam score of 78.
WA(80,84,76,78)

# STAT 614 only
#Using R to find statistical summary values and to create graphs and plots

x<- c(10,22,37,46,55,58,60)
x

y<-c(12,9,7.5,5,2,.5,.2)
y

plot(x,y)


hist(y)

boxplot(y)

summary(y)

barplot(y)

stem(x, scale = 2)

# Using R code to create a data frame.

# Example  Use R code to create the following data frame

#   Name Age Gender
#1  Bill  34  Male
#2  Anne  37  Female
#3 Frank  40  Male
#4  Mary  36  Female


# Solution

Name  <- c("Bill", "Anne", "Frank", "Mary")
Name
Age <- c(34, 37, 40, 36)
Age
Gender <- c("Male", "Female", "Male", "Female")
Gender

DF <- data.frame(Name, Age, Gender)
DF

# Finding statistical summaries and graphs for a variable of a data frame

#  Find the mean age of the data frame
mean(DF$Age)
#  Find the median age of the data frame
median(DF$Age)
#  Find  multiple statistical summary values for age
summary(DF$Age)

# Create a histogram for the variable AGE of the data frame.
hist(DF$Age)

q()
y
#########################################################


#GRAPHS

library(tidyverse)
#Creating a basic bar graph using raw counts values from data sets
#  (Tidyverse/ggplot method)  Chapter 1


#Let's create bar graphs from the mpg data frame

mpg

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl))  #Recall that the variable fl is an
#abbreviation for fuel type

library(dplyr)

mpg %>%
  count(fl)

# Change the x axis name to fuel type

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl)) +
  xlab("fuel type")

# color the bars of the graphs

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl, fill = fl))

# Lets consider a bar graph that features proportions instead of counts

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl, y = ..prop..,group =1))


# Lets show bar graphs for different manufacturers according to different
# types of fuels

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = fl, fill = manufacturer), position = 'dodge')




# Different Types of Bar Graphs

EmployeeInfo<- tribble(
  ~Name,  ~Gender,    ~Age,   ~PoliticalAffiliation, ~Salary,
  "Karen",   "Female", 32,        "Democrat",         63400,
  "Juan",   "Male",    42,        "Republican",       65000,
  "Alice",  "Female",  28,        "Democrat",         54500,
  "Robert", "Male",    32,        "Republican",       61200,
  "Fay",    "Female",  24,        "Independent",      66000,
  "Brian",  "Male",    30,        "Democrat",         72000,
  "Mary",   "Female",  25,        "Independent",      68000,
  "Anthony","Male",    32,        "Republican",       67000,
  "Aaron",  "Male",    27,        "Democrat",         67000
)

EmployeeInfo

#  A Bar Graph that shows counts of levels of a categorical variable
ggplot(data = EmployeeInfo) +
  geom_bar(mapping = aes(x = PoliticalAffiliation)) 

#  A Bar Graph that shows specific values for levels of a categorical variable
ggplot(data = EmployeeInfo) +
  geom_bar(mapping = aes(x = Name, y = Salary, fill = Name), stat = "identity")


# More Practice  Textbook problem.

# creating a bargraph using data with summary totals from created
#  data (Tidyverse Method)
library(tidyverse)

demo<-tribble(
  ~a,    ~b,
  "bar_1",  20,
  "bar_2",  30,
  "bar_3",  40
)

demo
# Now  create the bar graph  for created data.
ggplot (data = demo) +
  geom_bar(mapping = aes(x = a, y = b), stat = "identity") 


# Now create a colored bar graph
ggplot (data = demo) +
  geom_bar(mapping = aes(x = a, y = b ,fill = a), stat = "identity") 

#Let's create a pie chart using created data

#First let's create data

baseballdata<-tribble(
  ~Player,    ~StolenBases,
  "John",     32,
  "Ron",      16,
  "Phillip",  12,
  "Juan",     24
  
)

baseballdata

# First create a stacked bar plot

bp<- ggplot(baseballdata, aes(x="", y = StolenBases, fill=Player))+
  geom_bar(width = .5, stat = "identity") 
bp

# Now create the pie chart  
pie <- bp + coord_polar("y", start=0) 
pie


# Let's create a pie chart using existing data ( mpg data frame)
# regarding the variables drivetrain (drv) and city mileage (cty)


# Again, first let's create a stacked bargraph

cp<- ggplot(data = mpg, aes(x="", y = cty, fill=drv))+
  geom_bar(width = .5, stat = "identity")
cp

# Now create the pie chart   Lets add a title
pie <- cp + coord_polar("y", start=0) + ggtitle("Drivetrain City Mileage")
pie


#More practice creating pie charts  Another Method  (Base R Method)
#Create data for the graph.

# Create data for the graph.
x <- c(21, 62, 10, 53)
x
labels <- c("London", "New York", "Singapore", "Mumbai")
labels

# Plot the chart with title and rainbow color pallet.
pie(x, labels, main = "City pie chart", col = rainbow(length(x)))

# Now produce a pie chart that shows percentages
# Again, Create data for the graph.
y <-  c(21, 62, 10,53)
y
labels2 <-  c("London","New York","Singapore","Mumbai")
labels2


#Assign the percentage calculation to a variable
piepercent<- round(100*y/sum(y), 3)
piepercent


# Plot the chart.
pie(y, labels2 = piepercent, main = "City pie chart",col = rainbow(length(y)))
legend("bottomright", c("London","New York","Singapore","Mumbai"), cex = .8,
       fill = rainbow(length(y)))



#Now let's create a 3D pie chart
# Install the package plotrix

install.packages("plotrix")

library(plotrix)
Z <- c(21, 62, 10, 53)
Z

Cities <- c("London", "New York", "Singapore", "Mumbai")
Cities

pie3D(Z,labels = Cities, explode = .1, main = "3D Pie Chart ")


# Now create a 3D pie chart that reflects percentages

piepercent<- round(100*x/sum(x), 1)

Z <- c(21, 62, 10, 53)
Z

Cities <- c("London", "New York", "Singapore", "Mumbai")
Cities
pie3D(Z,labels =piepercent , explode = .1, main = "Pie Chart of Cities " )


# Lets add a legend

Cities <- c("London", "New York", "Singapore", "Mumbai")
Cities
pie3D(Z,labels =piepercent , explode = .1, main = "Pie Chart of Cities " )
legend("topleft", c("London","New York","Singapore","Mumbai"), cex = .75,
       fill = rainbow(length(x)))


# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries") 



# Lets create a Violin Plot for the variable hwy

# Note: a Violin plot conveys the distribution of the data in addition to the
# location of common summaries found in the corresponding boxplot.

ggplot(data=mpg) +
  geom_violin(mapping = aes(x = hwy, y = hwy)) 

# Now let's generate the violin plot along side the boxplot.
ggplot(data=mpg) +
  geom_violin(mapping = aes(x = hwy, y = hwy)) +
  geom_boxplot(mapping = aes(y = hwy)) +  
  coord_flip()

# Lets compare a violin Plot and a Boxplot for hwy

ggplot(data=mpg) +
  #geom_violin(mapping = aes(x = hwy, y = hwy)) +
  geom_boxplot(mapping = aes(y = hwy))


# Lets create a collection of Violin Plots for hwy over the character
# variable drv (drive train)

# for additional study of Violin Plots, access the link given below

ggplot(data=mpg) +
  geom_violin(mapping = aes(x = drv, y = hwy, fill = drv)) 


q()
y

#####################################

#DPLYR

library(ggplot2)
library(tidyverse)
library(dplyr)

# Data Transformation using dplyr

# Filtering  (selecting observations using their values)   filter

#Lets examine the diamonds data set
diamonds

?diamonds


# Choose only observations with a depth of 65.1

diamonds1<-filter(diamonds, depth==65.1)  # (double =)
diamonds1

# Choose only observations with a depth of 65.1 and a table value of 58
# (different column variables)
diamonds2<-filter(diamonds, depth==65.1 , table==58)
diamonds2

# Choose only observations with a depth of 65.1 or a depth of 62.3
# (same column variable)
diamonds3<-filter(diamonds,depth==65.1|depth==62.3)
diamonds3 

#Produce more than the default 10 rows.

print(diamonds3,  n=25)

#Choose only observations that have a depth that is greater than 50
diamonds4<-filter(diamonds, depth > 50)
diamonds4

#Choose only observations that have a color of E and a price that is 
#less than 338

diamonds5<-filter(diamonds, color == "E", price < 338 )
diamonds5

#Choose only observations that have a premium cut, a clarity of WS1,
#and a length that is greater than or equal to 3

diamonds6<-filter(diamonds, cut =="Premium" , clarity == "VVS1" , 
                  x >= 3)
diamonds6

#Choose only observations that have carat values between .45 and .50
# Print 30 rows.

diamonds77 <- filter(diamonds, carat<.50 , carat>.45)
diamonds77
print(diamonds77 , n=30)


# Arrange (changing the order of columns) 

#List the values of price from highest to lowest

# Let's look at diamonds again.
diamonds
# Note that the values for price are not sequenced in descending order.

diamonds7<- arrange(diamonds,  desc(price))
diamonds7


#List the values of price from lowest to highest. Print the first 20 rows
diamonds8 <- arrange (diamonds, price)
diamonds8
print(diamonds8, n=20)


# Select  (Choosing columns)   

# From the diamonds data set choose only columns carat, cut, and
# price
diamonds

diamonds9 <- select(diamonds, carat, cut, price)
diamonds9

# Change the order of the selection to price, cut, and then carat

diamonds10 <- select(diamonds, price, cut, carat)
diamonds10


# Deselect the columns carat,cut, and color

diamonds

diamonds11 <- select(diamonds,  -carat, -cut, -color)
diamonds11

#Mutate  (Adding columns to your data frame)

#Create a narrower data frame from diamonds
diamonds12<-select(diamonds, clarity,cut,price)
diamonds12

#Now add a variable column that decreases every price by 50
mutate(diamonds12,  dp = price-50)-> diamonds13
diamonds13

#Now add a varible that gives a ratio of dp to price
diamonds14<-mutate(diamonds13, ratio = (dp/price))
diamonds14

#Lets increase the output observations
print(diamonds14, n=50)


#Lets change the name of an observation item (We will capitalize Ideal
#of the cut column)   Use mutate along with recode

diamonds14

mutate(diamonds14, cut = recode(cut, "Ideal"= "IDEAL"))->
  diamonds15
diamonds15




# Transforming a data frame using the pipping process
# pipe operator  %>%

#Exampke 1
#From the diamonds data frame choose the variables price, x and y

diamonds%>%
  select(price,x,y)


#Example 2
#From the diamonds data frame, create a data frame that shows the 
#variables price and carat, but for only price values in descending
#order.  Print the first 20 rows. 
diamonds%>%
  select(price,carat)%>%
  arrange(desc(price))%>%
  print(n=20)


#Example 3
#From the diamonds data frame, create a data frame that shows the 
#variables price, carat and cut, but for only price values in descending
#order that are less than or equal to 400.  Print the first 15 rows.

diamonds%>%
  select(price,carat,cut)%>%
  filter(price<=400)%>%
  arrange(desc(price))%>%
  print(n=15)



#Example 4
#From the diamonds data frame, create a data frame that shows the 
#all variables except x, y, and z, but for only price values in descending
#order that are between 18000 and 18500 and only for cuts that are Very Good.
# Print the first 25 observations
diamonds%>%
  select(-x, -y, -z)%>%
  filter(price < 18500, price >18000)%>%
  filter(cut == "Very Good")%>%
  arrange(desc(price))%>%
  print(n=25)


# lets compare methods for using dplyr functions to modify a data
#frame

# Example 1

# From the diamonds data frame choose only price values that are 
# greater than 17000

# assigning to a variable
diamonds


k <-filter( diamonds,  price > 17000)
k

# Using the pipe process

diamonds %>%
  filter( price > 17000)


# Example 2

#From the diamonds data frame, create a data frame that shows the 
#variables price, carat and cut, but for only price values in descending
#order that are less than or equal to 400.  Print the first 15 rows.

#  Assigning Method

diamonds
A <- select(diamonds, price, carat, cut)
A
diamonds
B <- filter(A, price <= 400)
B
diamonds
C <- arrange(B, desc(price))
C  
print (C,  n = 15)

# Pipping Method


diamonds%>%
  select(price,carat,cut)%>%
  filter(price<=400)%>%
  arrange(desc(price))%>%
  print(n=15)




#Group by and Summarize

AA <-tribble(
  ~Name,      ~Gender,    ~PolParty,        ~Salary,  ~Age,
  "Ron",      "Male",       "Dem",           45000,     22,
  "Mary",     "Female",     "Rep",           53000,     25,
  "Juan",     "Male",       "Dem",           58000,     27,
  "Lindsy",   "Female",     "Rep",           50500,     30,
  "Abdul",    "Male",       "Dem",           61200,     32,
  "Leon",     "Male",       "Rep",           57200,     28,
  "Alice",    "Female",     "Dem",           60200,     25
)
AA

#Two ways to find the mean of a variable in a data frame

summary(AA)

summarise(AA, meansalary = mean(Salary))

# Now let's use the commands group by / summarise to find summary
#statistics for a levels of a categorical variable

# (I want the mean salaries for men and women separately)

AA %>%
  group_by(Gender) %>%
  summarise(MeanSalary = mean(Salary))


# (Now I want the mean salaries for men and women grouped by political party)

AA %>%
  group_by(Gender , PolParty) %>%
  summarise(MeanSalary = mean(Salary))


# Another Example


# For the mpg data frame let's find the average city miles per gallon
# for ford vehicles only.

mpg


mpg%>%
  select(manufacturer , cty, hwy)%>%
  group_by(manufacturer) %>%
  summarise(MeanCitymi = mean(cty), 
            MeanHighwaymi = mean(hwy))


#Textbook Example
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
library(dplyr)

flights
?flights
View(flights)


# Let's find the average arrival delay per carrier

flights%>%
  select(carrier,arr_delay)%>%
  group_by(carrier)%>%
  summarise(MeanArrivalDelay = mean(arr_delay, na = TRUE))


# Let's find the average departure delay with respect to year, month,
# and day

# Assignment method

by_day <- group_by(flights , year , month , day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))
by_day



# Piping method

flights%>%
  select(year,month,day, dep_delay)%>%
  group_by(year, month , day)%>%
  summarize(delay = mean(dep_delay , na.rm = TRUE) ) 


q()
y

################################################################

#TIDYING 


# Tidying Data
library(tidyverse)
library(tidyr)
library(dplyr)

# Let's re-visit table 4a which is untidy for the column headings "1999"
#and "2000" are not variables but values of a variable.  
table4a

# We obtain a much more tidy representation of the data by applying the
# the function pivot_longer and argument designations cols, names_to and
# values_to.  Consider and run the following code.

pivot_longer(table4a, cols =c( "1999", "2000"),  names_to = "year",
             values_to = "cases")


# Let's re-visit table 2 which is untidy for each observation is spread
# across two rows.
table2

# Note for example that the observation Afghanistan and 1999 are  
# represented in two rows.

# We obtain a much more tidy representation of the data by applying the
# the function pivot_wider and argument designations names_from and 
# values _from.  Consider and run the following code.

pivot_wider(table2, names_from = type
            , values_from = count)

# Note that the argument names_from was applied to the column heading, 
# type for it contained variable names  (cases and population).

#Separate
# separate() pulls apart one column into multiple columns, by splitting 
# wherever a separator character appears.  Let's look at table 3
table3

# We will produce a more tidy data set representation by separating the
# the variable rate into columns cases and population.  Consider and run
# the following code.

separate(table3, rate, into = c("cases" , "population"))

# Now consider a minor improvement on the previous code. Note that the
# output table indicates that the variables year, cases, and popula-
# tion are character columns.  We will change these designations so
# that columns will reflect integer output.

separate(table3, rate, into = c("cases" , "population"), convert =
           TRUE)


# Unite

# unite() is the inverse of separate(), it combines columns into a 
# single column.

# We will use table 5 to illustrate the usage of Unite.  Consider table
# 5

table5

# Note that century and year are separated, but they should be joined
# for better column representation.  Consider and run the following 
# code.

unite(table5 , year, century, year)

# Now let's improve on the column heading year by eliminating the under-
# score.  Consider and run the following code.

unite(table5 , year, century, year, sep = "")

# One more example
# NOw let us tidy a data set the needs several tidy actions.
# First, Let's read in the excel tidy practice data that was emailed.
read_csv("tidypracticedata.csv")->tp
tp

View(tp)

# Tidying actions
# 1
# We will move the columns Student ID and AGE. A better placement
# for the those variables would be in the front of the data set with
# the existing personal information for the student as opposed to 
# being placed at the rear of the data set.
#       

tp%>%
  select(StudentName , StudentID, GENDER , AGE, Assign1,
         Assign2, Assign3, Assign4 , Assign5, Assign6)

# 2
# Now let's calculate and display the mean for assignment score by
# mutating. Our goal is to create a table that conveys meaningful
# and significant information that is easy to identify. You may have
# to use the View function to see the mutated table.


tp%>%
  select(StudentName , StudentID, GENDER , AGE, Assign1,
         Assign2, Assign3, Assign4 , Assign5, Assign6)%>%
  mutate(MeanAssign = (Assign1 + Assign2 + Assign3 + Assign4
                       + Assign5 + Assign6)/6)->tp1
tp1

View(tp1)




# 3
# Our table is to wide and thus that makes interpreting and analyzing
# the data in our table harder.

# Now let's apply the pivot_long function to convert the data set from
# one that is initially to wide to one that is longer. The new repre-
# sentation will collect the 6 assignments for each person and place
# them under one column.

tp1%>%
  select(StudentName , StudentID, GENDER , AGE, everything())%>%
  pivot_longer(col = Assign1 : Assign6 , names_to = "Assignments", 
               values_to =  "AssignScores") -> tp2
tp2

View(tp2)
#After creating a longer table, you change your mind and decide that the wider table had a better
#and more practical appearance.  You apply R code to convert back to a wider representation

tp2%>%
  pivot_wider(names_from = Assignments, values_from = AssignScores) ->tp3
tp3
View(tp3)
# 4
# Another action is to eliminate the redundancy for the column AGE.
# The designation  yrs for each number of that column is not needed,
# for the column heading indicates what the numbers represent. To 
# accomplish this task we will use a parsing function.


tp2%>%
  pivot_wider(names_from = Assignments, values_from = AssignScores) -> tp3
tp3

tp3%>%
  mutate(AGE = parse_number(AGE)) 


# Let's arrange the student's Names in alphabetical order by First Name

tp3%>%
  mutate(AGE = parse_number(AGE))-> tp4
tp4

View(tp4)
tp4%>%
  arrange(StudentName)
# Now let's place the variable MeanAssign back at the end where it was originally

tp4%>%
  arrange(StudentName)-> tp5
tp5

tp5%>%
  select(StudentName:AGE, Assign1:Assign6, MeanAssign)

# Finally we note that we have a misspelling in the StudentName column.  Marry Hubbbard should be
# Mary Hubbard. We apply R code to correct the typo.

tp5%>%
  select(StudentName:AGE, Assign1:Assign6, MeanAssign)->tp6
tp6

View(tp6)

tp6%>%
  mutate(StudentName = recode(StudentName, "Mary Hubbbard" = "Mary Hubbard")) -> tp7
tp7

View(tp7)


# We now have a nice tidy concise data set.


# More Tidying

library(tidyverse)
library(dplyr)


fish_encounters

fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen)

fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen, values_fill = 0)

us_rent_income

us_rent_income%>%
  pivot_wider(names_from = variable, values_from = c(estimate, moe)) -> zz
zz

View(zz)


# Can perform aggregation with values_fn

warpbreaks

as.data.frame(warpbreaks)

# Let's transform to a tibble

as_tibble(warpbreaks)

# or

warpbreaks <- as_tibble(warpbreaks[c("wool", "tension", "breaks")])
warpbreaks


warpbreaks%>%
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = max
  )


#  More Tidying


# We will examine the embedded readr data table challenge

challenge <- read_csv(readr_example("challenge.csv"))
challenge

# readr has read the first 1000 rows and assigned types accordingly

# note that by default column x is designated dbl and column y has 
# missing values


# Let's examine further by examining observational rows not seen in
# the console


library(dplyr)

challenge%>%
  slice(1001 : 1010)

# note that column x started with integers, but it also has decimal
# numbers. The column designation for x is double.

# This is okay for a double can be an integer or a decimal number

is_double(123)

is_double(11.23)

# now let's consider the following

challenge <- read_csv(readr_example("challenge.csv"))


problems(challenge)

# Let's fix the problem

challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)

tail(challenge)


# Now let's run the following coding chunk

challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
) -> challenge2
challenge2



# Missing Values


#  Missing Values are typically denoted by  NA

# When missing values are used in operations, the result is NA
NA + NA

NA - 16

NA/16
#Let's find a the mean for values collected in a vector
c(16, 32, 14, 13) -> vector1
vector1

mean(vector1)

# Now let's attempt to find the mean for values in a vector that
# contains a missing value

c(16, 32, 14, 13, NA ) -> vector2
vector2

mean(vector2)


# Note that the result given is a NA


# We now calculate the mean controlling for the missing value using
# na.rm

mean(vector2, na.rm = TRUE)

# Another example

# Find the mean for the column b in the data table. Note that there
# are no missing values

tribble( ~a,   ~b, ~c,  ~d,
         "Jane", 2,  4,   6,
         "Ron",  8,  10,  12,
         "Mary", 14, 16,  18
) -> t1
t1

mean(t1$b)

# Now attempt to find the mean again for the values of column b, which
# now contains a missing value

tribble( ~a,   ~b, ~c,  ~d,
         "Jane", 2,  4,   6,
         "Ron",  NA,  10,  12,
         "Mary", 14, 16,  18
) -> t2
t2

mean(t2$b)    # Note that the result is NA



# We now calculate the mean, controlling for the missing values.
mean(t2$b, na.rm = TRUE)




q()
y

##############################################

#TIBBLES AND SUBSETTING

library(tidyverse)
library(nycflights13)
library(dplyr)
# Data Visualization Summary TIBBLES  SUBSETTING  CHAPTER 7

# Data Visualization Summary

# Investigation of a quantitative variable: a boxplot, histogram,
# summary command

iris
boxplot(iris$Sepal.Length)
hist(iris$Sepal.Length)
summary(iris$Sepal.Length)

# Investigation of a categorical variable:  levels , factor
levels(iris$Species)  # the different levels of the categorical
# varible

factor(iris$Species)  # the frequency of each level

iris%>%
  count(Species)      # the summary frequency of each level

# Investigation of a quantitative variable and a categorical variable:
# side by side boxplots

ggplot(data = iris) +
  geom_boxplot(mapping = aes(x = Species, y = Sepal.Length))

# Investigation of a relationship between two quantitative variables: 
# scatter plot

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width))



# Different types of bargraphs 

tribble(~Name,   ~Gender,  ~Age, ~Gradelevel, ~Examone, ~Examtwo,
        "Leon",   "Male",   18,      11,         72,      81,
        "Mary",   "Female", 17,      12,         82,      86,
        "Alice",  "Female", 18,      11,         77,      83,
        "Matthew","Male",   16,      11,         86,      80,
        "Rene",   "Female", 17,      11,         80,      91
) -> StudentData
StudentData

# basic bar graph (counts)

ggplot(data = StudentData) +  
  geom_bar(mapping = aes(x = Gender, fill = Gender))


# basic bar graph (categorical and quantitative variable pairings)

ggplot(data = StudentData) +  
  geom_bar(mapping = aes(x = Name, y = Examone, fill = Name),
           stat = "identity")


# same bar graph with lables

ggplot(data = StudentData) +  
  geom_bar(mapping = aes(x = Name, y = Examone, fill = Name),
           stat = "identity") +
  geom_text(aes(x = Name, y = Examone, label = Examone), vjust = 2,
            size = 5, color = "darkred")


#Investigation of a relationship between two categorical variables:

diamonds

# Lets investigate a relationship between the variables cut and color.
# Both are categorical.

# method 1 use the ggplot coding chunk;  geom_count command
ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

# method 2 use the command count with dplyr
diamonds%>%
  count(color, cut)

# method 3 create a tile visualization

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

# TIBBLES  SUBSETTING

# Tibbles vs Regular Data Frames

# How can you tell if an object is a tibble? 
# (Hint: try printing mtcars, which is a regular data frame).

mtcars

# Generally, a tibble is a data set representation characterized by the
# display of the first ten or fewer rows and all of the variables that
# can be displayed in the console.

# Regarding mtcars, we can use r code to determine if mt cars is a tibble
# or not.

is_tibble(mtcars)

# mt cars as constructed is not a tibble, let's convert mtcars to a 
# tibble.

as_tibble(mtcars)

# Let's use r code to determine if the data sets diamonds and flights are
# tibbles.

is_tibble(diamonds)

diamonds

is_tibble(flights)

flights

# Recall that we converted mtcars to a tibble using as_tbble.  Now Use r
# coding to confirm that the converted mtcars is indeed a tibble.


is_tibble (as_tibble(mtcars))


# Now we practice creating tibbles

# Example 1
# Create a tibble of three columns; one has positive integers 1 to 5
# inclusive, another has all 1's, and for the third, each x value is
# raised to a power of 2 and the result is added to the value for y.


tibble(
  x = 1:5,
  y = 1,
  z = x^2 + y
)

# Example 2

# Create a tibble of 4 columns. The first column (a) has even integers 
# 2 thru 20, the second column (b) contains (a) values divided by 4,
# the third column (c) has the value 5 for each observational row, the 
# fourth column has the difference between columns (c) and (b), 
# and the last column (e) has the value k for each observational row.

tibble(
  a = 2*(1:10),
  b = a/4,
  c = 5,
  d = c - b,
  e = "k"
)


# It is possible for a tibble to have column names that are not valid
# R variable names?  You should surround these variables with back ticks
# `

# Example
# Let's suppose one column name is :: and it contains integers 1 thru 10
# 1:10. The other column name is 350 and it contains the letter b for
# all observational rows.

tibble(
  `::` = 1:10,
  `350` = "b"
)

# Another way to create a data table is with tribble()

# Example
# Create a tibble that shows the state and population for the
# three cities  Baltimore, Philadelphia, and Atlanta.

tribble(
  ~City,             ~State,                 ~Populatin,
  "Baltimore",        "Maryland",            619497,       
  "Philadelphia",     "Pennsylvania",        1581000,
  "Atlanta",          "Georgia",             486290
)

# Lets Take another look at the data set mpg.  Is mpg a tibble ?

is_tibble(mpg)

# The result should be true. Lets confirm that it is true.
mpg

# Note that a maximum of 10 rows were generated.

# How can we produce more rows?

mpg%>%
  print(n=30)


# How to convert a tibble to a regular data frame
#  Remember that diamonds is a tibble

diamonds

# Remember that diamonds is tibble

is_tibble(diamonds)

# Let's convert diamonds to a regular data frame
as.data.frame(diamonds)

# Let's exam mtcars

mtcars

is.data.frame(mtcars)


is_tibble(mtcars)

# SUBSETTING  (Extracting variables from a data table)

# First let's explore the functions rnorm and runif
# rnorm :  randomly selecting numbers from a normal distribution


# Example1
#Let's randomly generate 10 numbers from a normal distribution that has
# mean of 0 and a standard deviation of 1
rnorm(10, mean = 0, sd = 1) 

# or

rnorm(10)

# Example 2

# Let's randomly generate 10 numbers from a normal distribution that has
# a mean of 24 and a standard deviation 3.


rnorm(10, mean = 24, sd = 3)

# runif : is used to generate  random numbers that lie between a given 
# minimum and maximum. 

#Example 3

# Now let's randomly generate 10 numbers between 0 and 1


runif(10, min = 0 , max = 1)

# Now let's randomly generate 10 numbers beween 5 and 15

runif(10, min = 5 , max = 15)

# If you do not indicate a minimum or a maximum, the defaults are
# minimum = 0 and maximum = 1.

runif(10)

# or

runif(10, min = 0 , max = 1)


# Now to Susetting

# Consider the following tibble

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df


# Let's subset for x from df

# method 1  Use of  $
df$x

# Let's subset for y from df
df$y

# Let's consider the data table mtcars
mtcars

# Let's subset for mpg from mtcars

mtcars$mpg

# method 2  Use of double brackets  [[ ]]

df[["x"]]  # df$x gives the same result

df[["y"]]  # df$y gives the same result

mtcars[["mpg"]]  # mtcars$mpg gives the same result

# Let's now subset by position

df

df[[1]]   # since the x variable is first (from left to right) we will get all
# of the x values


df[[2]]   # since the y variable is second (from left to right) we will get all
# of the y values

# for which variable will all values be produced for the following
# code?
mtcars[[3]]

# Example 4

# More Susetting

# Let's create a data table by modifying mpg.

mpg%>%
  select(manufacturer ,model, hwy)%>%
  filter(hwy>34) -> ghwym
ghwym

ghwym

# Subset by name (using the $ sign)
ghwym$model

# Subset by name (using double brackets)
ghwym[["model"]]

# Subset by position (using double brackets)
ghwym[[2]]


ghwym[[3]]




q()
y


#######################################################

#KEYS AND JOINS


library(tidyverse)
library(nycflights13)
library(dplyr)
#Chapter 10 / Relational Data

# We will explore relations between pairs of data tables. In order to
# to do so we will use and analyze data tables from the nycfilghts13
# package and other standard data tables that we have analyzed so
# far

# The variables used to connect pairs of tables are called keys. A key
# is a variable (or set of variables) that uniquely identifies an
# observation of a table.

# Consider the data table planes.  Note that for the variable tailnum,
# all observations are different(unique). Hence the variable tailnum
# is a key.

planes

# Also, note that the variable model of the planes data set is not a
# key, for the observations are not the same.

# We now consider a formal coding technique to determine if a 
# variable (or set of variables) is a key without eyeballing the 
# table.

# Example 1  We show formally that tailnum is a key for the data set
# planes

# We  formally show that tailnum is a key for the planes data 
# table by using  the following R coding chunk.
planes %>%
  count(tailnum)%>%
  filter(n>1)

install.packages(“devtools")
# Tailnum is a key for the planes data table for the output shows
#  tibble: 0 X 2 ( The 0 tells us that you do not have more than
# 1 observation for each tailnumber designation,) All tailnumber
# entries are different


# Example 2  We show formally that the variable model is not a
# key for the data set planes. Consider the following R coding 
# sequence

planes %>%
  count(model)%>%
  filter(n>1)

# Note that the output shows that the entries for the variable model
# are not all different, for example the model 717-200 appears 88 
# times.  Also, the output message  A tibble 79 X 2 tells us that we
# have 79 model observations that have more than 1 designation.

# Example 3
# We now verify that the variable carrier is a key for the
# table airlines

airlines

airlines %>%
  count(carrier)%>%
  filter(n>1)

#Example 4
# Recall that a key can be a set or collection of variables.
# Confirm that the collection of variables(year, month, day, hour, 
# origin, humid) is a key for the table weather

weather

weather %>%
  count(year, month, day, hour, origin, humid)%>%
  filter(n>1)

# There are two types of keys ;
# A primary key uniquely identifies an observation in its own
# table

# A foreign key uniquely identifies an observation in another
# table.
# The variable tailnum is a primary key for the data table planes,
# for it uniquely identifies each plane in the planes table, but
# tailnum is a foreign key for the table flights for it identifies
# a unique observation in the planes table.

planes

planes%>%
  count(tailnum)%>%
  filter(n>1)


flights

flights%>%
  count(tailnum)%>%
  filter(n>1)


# Mutating Joins
# We can combine variables from two tables by executing a Mutating
# Join

# In order to illustrate the different types of mutating joins, we 
# consider two basic data tables that we will call x  and  y.

# The two tables are created below,  Run each table construction to
# view the profile of each table.

x<- tribble(
  ~num,  ~color,
  1,  "red",
  2,  "red",
  3,  "blue"
)
x

y<- tribble(
  ~num,  ~color,
  1,  "blue",
  2,  "green",
  4,  "blue"
)
y

# Note that for each table, the key is the variable num.

# Example 5
# We will first combine the two tables x and y by executing an
# "inner join".  An inner join matches pairs of  observations from
# the tables whenever their keys are equal.


x%>%
  inner_join(y, by ="num")

#Note that you have observations for the key(num) elements 1  and  2.
# that both tables have in common.

# Example 6
# We will now combine the two tables x and y by 
# executing a "left join".  A left join keeps all of the
# observations in x.

x%>%
  left_join(y, by ="num")

# Example 7
# We will now combine the two tables x and y by 
# executing an "right join".  A right join keeps all of the
# observations in y.

x%>%
  right_join(y, by ="num")

# Example 8
# We will now combine the two tables x and y by 
# executing a "full join". A full join keeps all of the
# observations in x and y.

x%>%
  full_join(y, by ="num")


# Example 9
# Use R coding to show that the variable country is a key for the
# data sets table 4a and table 4b

table4a

table4a%>%
  count(country)%>%
  filter(n>1)

table4b

table4b%>%
  count(country)%>%
  filter(n>1)

# Now perform a left join on the tables 4a and 4b (Note that the
# key is country for both tables)

table4a%>%
  left_join(table4b ,  by ="country")


# Duplicate Keys

# We now perform joins involving tables with duplicate keys. (Duplicate Keys: Observations across 
# the table are unique, but you have repetition in the key column)  

tablex <- tribble(
  ~key,  ~val_x,
  1,   "x1",
  2,   "x2",     # note that for tablex, you have unique observational rows, but duplication
  2,   "x3",     # in the key column
  1,   "x4"
)
tablex


tabley <- tribble(
  ~key,  ~val_y,
  1,   "y1",
  2,   "y2"
)
tabley

# We now execute a left join on the tables

tablex%>%
  left_join(tabley, by = "key")

# Note that we can use alternative R coding to get the same left join result

left_join(tablex , tabley,  by = "key")


# What type of left join representation is obtained when both tables have duplicate keys ?
# (this will be a homework problem)


# Let's take a look at the data tables q and z  

q<- tribble(                   
  ~num,  ~color, ~direction,                 
  1,  "red",    "north",                    
  2,  "red",    "south",                
  3,  "blue",    "east"                   
)                                
q                       # We can join tables by only outputting  the observations that they have in    
# common.  Such a join is called a semi join.  The anti join will give you
z<- tribble(            # the opposite output.That is, the observations that they do not have in 
  ~num,  ~color,   ~direction,         # common
  1,  "blue",   "west",
  2,  "red",    "south",
  4,  "blue",   "north"
)
z

q%>%
  semi_join(z)

q%>%
  anti_join(z)

# Let's revisit the tables q and z  
q<- tribble(                   
  ~num,  ~color, ~direction,                 
  1,  "red",    "north",                    
  2,  "red",    "south",                
  3,  "blue",    "east"                   
)                                
q


z<- tribble(            
  ~num,  ~color,   ~direction,        
  1,  "blue",   "west",
  2,  "red",    "south",
  4,  "blue",   "north"
)
z

# Optional coding for joining or merging tables

intersect(q,z)  # we will produce a table that has the observations common to both  (semi_join)
union(q,z)   # we will produce a table that shows all observations (the intersect observation is
# shown only one however)
setdiff(q,z) # observations in q that are not in z
setdiff(z,q) # observations in z that are not in q



q()
y



###############################################################################

#FACETWRAP

#Chapter 2 Data Visualization ggplot practice (Tidyverse coding)
library(tidyverse)
mpg
View(mpg)
?mpg
#Lets create a boxplot
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y=cty))

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y=cty)) +
  coord_flip()


#Creating side by side boxplots (Show boxplots for highway mileage with respect to levels of a
# character variable)

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x=drv, y=hwy)) 


# Lets create histogram
ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty))  #Tidyverse method

hist(mpg$cty)  #base R method


# Lets create stem and leaf plot
stem(mpg$cty)  # base R method


#bar graph
ggplot(data=mpg) +
  geom_bar(mapping = aes(drv))


# Lets create a scatter plot
plot(mpg$cty ~ mpg$hwy)   # base R method

ggplot(data=mpg) +
  geom_point(mapping = aes(x = cty, y=hwy))   #Tidyverse method


#scatter plot  (change the color of the data points)
ggplot(data=mpg) +
  geom_point(mapping = aes(x = cty, y=hwy), color = "red")

#scatter plot  (reflects patterns for different levels of a categorical variable)
ggplot(data=mpg) +
  geom_point(mapping = aes(x = cty, y=hwy, color = trans))


#scatter plot (adding a title and axis labels to the graph)
ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy)) +
  xlab("city") +
  ylab("highway") +
  ggtitle("milespergallon")
#scatter plot (adding a regression line to your plot)
ggplot(data=mpg) +
  geom_point(mapping = aes(x=cty, y=hwy)) +
  xlab("city") +
  ylab("highway") + 
  ggtitle("milespergallon") +
  geom_smooth(method=lm, mapping=aes(x=cty,y=hwy)) 


#scatter plot (Adding a line that follows the general path of the 
#scatter plot)

ggplot(data=mpg) +
  geom_point(mapping = aes(x = cty, y=hwy)) +
  geom_smooth(mapping = aes(x = cty, y=hwy))


#scatter plot (Producing smooth lines for a specified categorical
#variable)
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y=hwy)) +
  geom_smooth(mapping = aes(x = displ, y=hwy, color = drv))


library(ggplot2)
mpg

#Creating Facet Plots

#example1 (Plotting over different levels for one categorical variable)
ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +
  facet_wrap(~drv) 

#example2 (Plotting over different levels for one categorical variable, also showing regression lines)

ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +
  geom_smooth(method=lm,se= FALSE) +
  facet_wrap(~drv) 



#example3  (Plotting over different levels for two categorical variables)
ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE) +
  facet_grid(cyl~drv)

#example4  (Two ways for creating a histogram)
#method 1
ggplot(data = mpg) +
  geom_histogram(mapping= aes(x=hwy, binwidth = 2))

#method 2
ggplot(data=mpg, mapping = aes(x=hwy)) +
  geom_histogram(binwidth = 2)  

#example5 (Facet plotting for histograms over different levels of one
#categorical variable)
ggplot(data = mpg) +
  geom_histogram(mapping= aes(x=hwy)) +
  facet_wrap(~drv)


#example6 (Facet plotting for boxplots over different levels of one
#categorical variable)
ggplot(data = mpg)  +
  geom_boxplot(mapping=aes(y=cty)) +
  facet_wrap(~drv)


#example7 (Facet plotting for boxplots over different levels of two
#categorical variables)

ggplot(data = mpg)  +  
  geom_boxplot(mapping=aes(y=cty)) +
  facet_grid(cyl~drv)

#example 8  (changing the number of rows and columns of a facet plot)
ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +
  facet_wrap(~class) 

# Change to 2 rows
ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +              
  facet_wrap(~class, nrow = 2) 


# Change to 2 columns
ggplot(data=mpg, mapping=(aes(x=cty,y=hwy))) +
  geom_point() +
  facet_wrap(~class , ncol = 2) 

q()
y

########################################################################



#CHAPTER EIGHT  DATA PARSING AND TRIBBLE AND EXCEL AND CSV

library(tidyverse)


# Recall how we created a data table earlier in the course.
# We used a tribble construction.

tribble(~a, ~b, ~c, ~d,
        "Jane", 2, 4, 6,
        "Ron", 8, 10, 12,
        "Mary", 14, 16, 18
)

# We now introduce new coding that will produce a data table

# read_csv()  produces a data table

# The first line entry are column headers
# The description of each variable is indicated
# (integer, double, or character)

read_csv("a,b,c,d
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18")


# You can eliminate unwanted lines from you data table
read_csv("This is a fun assignment
         You must learn to grow
         a,b,c,d
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18")

read_csv("This is a fun assignment
         You must learn to grow
         a,b,c,d
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18", skip = 2)

read_csv("This is a fun assignment
         You must learn to grow
         a,b,c,d
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18", skip = 3)

# In order to eliminate a statement from the output you can also use # along with
# the statement comment = "#" at the end

read_csv("#This is a fun assignment
         a,b,c,d
         2,4,6,8", comment = "#")

# You can use the argument col_names = FALSE, if you do not 
# want to treat the first row as column headings

read_csv("a,b,c,d           
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18")

# Note that the first row (a, b, c, d) will be treated as 
# column headings


read_csv("a,b,c,d           
         Jane,2,4,6
         Ron,8,10,12
         Mary,14,16,18", col_names = FALSE)

# Note that the first row (a, b, c, d) will not be treated as 
# column headings

# An alternate method for creating a read_csv table: 
# use the expression \n (next line)

read_csv("a,b,c,d\nJane,2,4,6\nRon,8,10,12\nMary,14,16,18")

#  You can use the expression,  na = " " , to embed a symbol 
# to be used for missing values

read_csv("a,b,c,d
         Jane, mv,4,6
         Ron,8,10,12
         Mary,14,16,mv", na = "mv")

# Using readr to import external files into R

#Step 1  Set your working directory (the location where R will look for files and store files)
#  Sessions ->  Set Working Directory ->  Choose Directory (I normally choose the Desktop) ->
#  click on open at the bottom of the window.

#Step 2  Use the import R code Below  (Be careful about entering the name of the file) Assign the 
#        imported file to a variable of your choice
read_csv("Book1.csv") -> ex
ex

#Parsing a Vector
parse_integer(c("1","3","17","23"))

parse_integer(c("20", "-10", "1.23"))


parse_integer(c("20", "-10", "1.23")) -> x
x

problems(x)

parse_integer(c("3", "1.01", "14", "311", "aba", "45", ".003"))


parse_double(c("3", "1.01", "14", "311", "aba", "45", ".003"))


# Parsing for number value exclusively
parse_number("$112")

parse_number("15%")

parse_number("321,504,112")

# Lets eliminate the $ signs for content of variable b 
# in the following data table by parsing

read_csv("a,b,c,d
         Jane,$2,4,6
         Ron,$8,10,12
         Mary,$14,16,18")


read_csv("a,b,c,d
         Jane,$2,4,6
         Ron,$8,10,12
         Mary,$14,16,18") -> K
K

parse_number(K$b)

library(dplyr)

mutate(K, b=parse_number(b))

# Parsing factors   Factors are used in R to represent
# categorical variables that have a known set of values

# Example 1    Sports <- c(Tennis, Football, Baseball, Soccer, Basketball)

Sports <- c("Tennis", "Football", "Baseball", "Soccer", "Basketball")
Sports


parse_factor(c("Tennis", "Football", "Baseball", "Soccer",
               "Basketball","Sleeping"), levels = Sports)

# We should get a warning for Sleeping is not a sport


# Example 2     Religions<- c("Christianity", "Islam", "Judaism", 
#                             "Hinduism")

Religions<- c("Christianity", "Islam", "Judaism", "Hinduism")
parse_factor(c("Christianity", "Communism", "Chemistry", "Hinduism"),
             levels = Religions)


# Parsing Vectors with regard to Date and Time

install.packages("lubricate")
library(lubridate)
# The command parse_date() expects a four-digit year, a month and a day. 
# The intervals of time are separated by a hyphen or a forward slash
parse_date("1956/05/18")

install.packages("hms")
library(hms)

# parse_time() expects the hour, :, minutes, optionally : and seconds, and an optional a.m./p.m 
# specifier
parse_time("20:10:01")


q()
y

#########################################################################


#  STAT 412/612
#  STRINGS  

library(tidyverse)
library(stringr)
library(dplyr)


#  PART 1

# What is a string ?
# A "string" is just a character variable that contains one or
# more characters. ... A character vector is a set of strings 
# stored as a single object. Most R functions that work on 
# character input are vectorised, i.e they will return the 
# appropriate value for each element in such a vector.

# The following are typical strings:

# Example 1  "a"
# Example 2  "abc"
# Example 3  "April"

# As stated, multiple strings are often stored in a character vector. 
# they can be generated by by using c( )

# Example 4

c("nba" , "nfl" , "nhl", "mlb" , "ncaa")

# Note that strings have to be enclosed in quotes. If one is omitted,
# your output will feature a continuation character +.  Consider and
# try to run the following; (remove the # sound first)

# "BernieSanders

# Did you not get the continuation character + ?

# Now run the following:  This is correct string notation.

"BernieSanders"


# Strings can be created using either single quotes or double quotes.
# Preferably, most use double quotes, " ". If, however, you wish to 
# create a string within a string single quotes should also be used.

# Example 5  
"Yesterday John said 'I am happy' over and over again"

# To include a literal single or double quote in a string, you will
# have to "escape" it with a forward slash.  \

#Example 6   I want the content of my string to reflect the 
# following,  ", ', or \ .  To show the content of my string, I must use the
# command  witeLines

# Solution

writeLines("\"")

writeLines("\'")

writeLines("\\")




# Note that we did output  " , ' and \.
.
# Example 7  I now want the content of my string to reflect the
# following, \abc

# Solution

writeLines("\\abc")

# Example 8

# Let's consider the following vector assignment.
x<- c("\"" , "\\")
x

# What elements do you think will be "escaped' ?

# Again, we will find out by using writeLines.

writeLines(x)

# If your answers were  "  and  \  you were correct !!  Good Job

# Finally, let's consider the vector again on line 27,

c("nba" , "nfl" , "nhl", "mlb" , "ncaa")

# If we run this without writeLines we get the double quoted notation again.

# You must use the writeLines command to get the desired content of
# the collection of strings (without the double quotes)
writeLines(c("nba" , "nfl" , "nhl", "mlb" , "ncaa"))


# String Length  
# We will use the stringr function str_length() to determine the 
# length of a string.

# Example 9
# Use r coding to confirm that the string "abcde" has a length of 5.

# Solution
str_length("abcde")

# Example 10
# Use r coding to confirm that the string "abc de" has a length of
# 6.

# Solution
str_length("abc de")


# Example 10
# Use r coding to confirm that the vector collection of strings 
# c("a","ab", "abc") have lengths of 1 , 2 , and 3.

# Solution
str_length(c("a","ab", "abc"))

# Combining Strings
# In order to combine strings, we will use the stringr function
#str_c()

# Example 11   Use r coding to combine the strings "a"  and "bc"

str_c("a" , "bc")

# Example 12  Use r coding to combine the strings "n" , "f", "l"

str_c('n' , "f" , "l")

# You can also determine how the elements are separated by using a
# sep argument as follows;

str_c("n" , "f" , "l" , sep = "/")

# Example 13  Use r coding to combine the strings "ford" and the 
# vector c("a" ' "b")

str_c("ford" , c("a","b"))

#  And now remove the double quotes

writeLines(str_c("ford" , c("a","b")))

# Collapsing Strings   
# To collapse a collection of strings into a single string, use 
# collapse.

# Example 14
str_c(c("ab" , "cd", "ef") , collapse = " , ")

# Note that you have one string instead of a collection of three strings


# Sub-setting Strings
# We can use the function str_sub() to extract parts of a string.

# We will use the following vector of strings to illustrate some
# sub-setting procedures.

x<- c("abcd" , "efghi")
x

# str_sub(x, 1,3)   (For each string, start with the first element
# and end with the third element . Include all elements in between)

str_sub(x, 1,3)

# str_sub(x, 2,4)    (For each string, start with the second element
# and end with the fourth element. Include all elements in between)

str_sub(x, 2,4)


# We can also change text to upper case or lower case by using 
# str_to_lower or str_to_upper

# str_to_upper(str_sub(x,1,2))  (We will change the first element and
# the second element of each string to upper case letters)

x<- c("abcd" , "efghi")
x

str_to_upper(str_sub(x,1,2))

# What will the following code output?

str_to_upper(str_sub(x))


# PART 2

# Matching  Patterns with Regular Expressions

# Basic Matches (Use the function str_view to force Basic Matches)

# Example 15 (For the vector of strings assigned x, force a match
# for   an)

install.packages("htmlwidgets")
library(htmlwidgets)

x<- c("apple", "banana", "pear")
x
str_view(x, "an")

# Examples 16-18 (In this example the use of periods placed before 
# and after a character, will match any character, except a newline)

x<- c("apple", "banana", "pear")
str_view(x , ".a.")

str_view("bonanza" , ".z.")

str_view("bonanza" , ".on.")

# Anchors (A regular expression can be anchored , so that it 
# matches the start or the end of a string.)  Use  ^ to match the
# start and use $ to match the end)

# Example 19 (The following code will force matches if the starting
# character of a string is  M)
str_view(c("Minnesota" ,"Kansas" , "Maine") , "^M")

# Example 20 (The following code will force matches if the ending
# character of a string is s)
str_view(c("Minnesota" ,"Kansas" , "Maine") , "s$")

# To match an entire string, use ^ and $
# Example 21 (The following code will force a match for a full string
# )

str_view(c("Minnesota" ,"Kansas" , "Maine") , "^Kansas$")

# For another string application we will use the corpus of common
# words.  (Run the following code to produce the matrix of words)

stringr ::  words

# Example 22  (Create regular expressions that will find words that
# start with p)

str_subset(words, "^p")

# Example 23  (Create regular expressions that will find words that
# end with p)

str_subset(words, "p$")


# Example 24  (Create regular expressions that will find words that
# start with p or a b)

str_subset(words, "^[p|b]")


# Example 25  (Create regular expressions that finds  all
# words that end with "ing") Note the use of parentheses

str_subset(words, "(ing)$")

# Example 26  (Create regular expressions that find all
# words that have exactly 10 characters) 
# Note the use of periods)

str_subset(words, "^..........$")

# Example 27  (Create regular expressions that find all
# words that have 10 or more characters) 
# Note the use of periods)

str_subset(words, "..........")


# Example 28  (Create regular expressions that find all
# four letter words that end in t

str_subset(words, "^...t$")

# Example 29  (Create regular expressions that find all
# words that start with mo and end with y.  i.e.  monday


str_subset(words, "^mo") -> z
z
str_subset(z, "y$") 


# Example 30  (Create regular expressions that find all
# words that end in t or s)

str_subset(words,  "[t|s]$")


# Example 31  (Create regular expressions that find all
# words that end in st)

str_subset(words,  "(st)$")


# Example 31  (Create regular expressions that find all
# words that end in st and ct)

# method 1

str_subset(words,  "[(st)|(ct)]$") # Did not work !!


# method 2
str_subset(words,  "(ct)$") -> x
x

str_subset(words,  "(st)$") -> y
y

union(x,y)     # This works !!



q()
y
####################################################################

#REGULAR EXPRESSION

# Matching Patterns with Regular Expressions

library(tidyverse)
library(stringr)

# We will use str_view() and str_view_all() in order to match string 
# patterns with regular expressions.

# Example 1  
# Let us determine where the matches occur for a regular expression 
# and the following collection of strings;  "apple" , "banana" , and  
# "pear"

str_view(c("apple" , "banana" , "pear")  ,  "an")

# Note that the pattern  an  is highlighted

# Example 2
# Here is a special case;  The ordinary  period  (.)  will match any
# character

# Lets use the same vector in Example 1 and find a match for b and the
# next character to the right of b , hence we are matching  b.

str_view(c("apple" , "banana" , "pear")  ,  "b.")


# Again, use the same vector in Example 1 and find a match for a and 
# any immediate character to the right of a and any immediate
# character to the left of  a , hence we are matching  .a.

str_view(c("apple" , "banana" , "pear")  ,  ".a.")


# If the period will match any character, How do we match a period?
# We do this by using the backslash symbol  \   The \ will escape a
# period and another backslash.

# In the next example, lets match the pattern a.b  In order for the
# period to be escaped, we need a \ , hence we need the expression \.
# to escape the period.  We use strings however to represent regular
# expressions so we will need to first escape the \ that is inside
# of the string.

# We are trying to match the pattern a.b, note that we get an error for
# the following

str_view(c( "a.b",  "ab" , "abc") ,  "a\.b") 


# We need to escape the \ also, so we will need another backslash. 
# Now consider and run the following code

str_view(c( "a.b",  "ab" , "abc") ,  "a\\.b") 

# of course the following matching construction works also


str_view(c( "a.b",  "ab" , "abc") ,  "a.b") 



# If \ is used a an escape character in regular expressions, how do 
# you match a literal \ ? You need to create a regular expression \\.
# Now to create that regular expression you need a string. 
# Note that a string of four backslashes "\\\\" will match one.!!

# Lets match a\b, given the following string;

str_view("a\\b" ,  "\\\\") 

# Note that the output shows a match of  \ .

# Note:  Strings are enclosed by double quotes.  Regular Expressions
# are not enclosed by double quotes.

#  Sting ->  "\\'"
#  Regular Expression ->  \\"

# create a string that will force a match for 
# the regular expression one backslash   \  
#  "\\"
# confirm your answer by using writeLines
writeLines("\\")

# create a string that will force a match for the 
# regular expression  two backslashes   \\
# "\\\\"

# confirm your answer using writeLines
writeLines("\\\\")

# create a string that will release a period   .
#  "."

# confirm by using writeLines
writeLines(".")

# create a string that will force a match for the regular 
# expression of a backslash and then a period   \.

# "\\."

# confirm by using writeLines
writeLines("\\.")



# Example: Produce a string that will force a match for the
# regular expression \""

# Solution:  We need to escape three symbols with backslashes.
# So between the double quotes we have:
# "\\\"\""


# We now use the function writeLines to confirm that our code is
# correct
writeLines("\\\"\"")

# Note that the output is indeed  \""



# Anchors Away  (The symbols ^ an $ are called anchors)

# We will use the carrot ^ to match a regular expression to the start
# of a string.
# Example: for the vector of strings, c("apple", "banana", "pear"),
# use a regular expression that will match a string that starts with 
# an a.

x<-c("apple", "banana", "pear")
x
str_view(x,  "^a")


# We will use the dollar sign $ to match a regular expression to the end
# of a string.

# Example: for the vector of strings, c("apple", "banana", "pear"),
# use a regular expression that will match a string that ends with 
# an r.

x<-c("apple", "banana", "pear")
x
str_view(x,  "r$")


# To force a regular expression to only match a complete string,
# anchor it with both ^ and $. Consider the following example for
# which we want to match the pattern Boston only.

str_view(c("Boston Celtics", "Boston Bruins", "Boston"), "^Boston$")

# Without the anchors all patterns of Boston in every string will be
# highlighted

str_view(c("Boston Celtics", "Boston Bruins", "Boston"), "Boston")


#Repetition

#You can control how many times a pattern matches with the 
# repetition operators:

# ?: 0 or 1.
# +: 1 or more.
# *: 0 or more.

# We will use the stringr function str_extract for these procedures


x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
x
# Extract the pattern CC from MDCCCLXXXVIII
str_extract(x, "CC?")
# Extract the pattern XVII from MDCCCLXXXVIII
str_extract(x, 'XVII')
# Extract the maximum number of X's from MDCCCLXXXVIII
str_extract(x, "X+")
# Extract a C and the maximum number of L's and X's from 
# MDCCCLXXXVIII
str_extract(x, 'C[LX]+')

# You can also specify the number of matches precisely:

# {n}: exactly n
# {n,}: n or more
# {n,m}: between n and m

str_extract(x, "C{2}") # Extract 2 C's

str_extract(x, "C{2,}") # Extract 2 or more C's

# note that the same result can be obtained using previous coding
str_extract(x, "CC+")

str_extract(x, "I{1,4}") # Extract between 1 and 4 I's

# Grouping and Backreferences

# Parentheses define groups, and coupled with backreferences (\1, \2
# etc allow for interesting matches)

# Example
# Let's find a regular expression that will match words with a
# repeated pair of letters.

# We want a pair of letters,   (..)  examples:  abab, xyxy
# We want to repeat the pair once,   \1
# We need to escape the backslash so the sting will have \\1
# Now our string we will use to match is;   "(..)\\1"

# We will confirm our solution by considering the following 
# vector; y = c("papa", "chocolate", "cucumber", 'cabbage").
library(tidyverse)
str_view(c("papa", "chocolate", "cucumber", "cabbage"),
         "(..)\\1" , match = TRUE)
# Note that only the words that have a repeated pair of 
# letters are displayed

# Another example;
# Let's create a regular expression that matches patterns whereby 
# the order of the first letter and the second letter are switched 
# in the pattern.  For example;  abba
# Solution
# Two individual letters   (.)(.)
# There is an order switch,  so instead of  \1\2 we have  \2\1,
# Now remember we have to escape the backslashes, so the string will
# have \\2\\1
# Our string that we will use to force a match is "(.)(.)\\2\\1"

# We now test and confirm our solution by forcing a match for the 
# following vector;  c("maple", "boob", "cece")

str_view(c("maple", "boob", "cece") , "(.)(.)\\2\\1")

# Note that the only pattern with the stated characteristic , boob,
# is highlighted.


# Produce a pattern that will match the word church for the 
# following vector of strings

# Solution 1 (specific solution)
str_view(c("church", "calling", "crab", "cookie") , "church")

# What is special about the word church ?

# Solution 2  (general solution)
str_view(c("church", "calling", "crab", "cookie") , "(..)..\\1")  
# think about this solution !!



# Another example: Use a general solution regular expression to 
# match the string that starts and ends with the same letter

str_view(c("lion","anaconda", "zebra", "eagle", "bear"),
         "(.).*\\1") 


# Last example: Use a general solution regular expression to 
# match the string that has four consecutive identical letters

str_view(c("aaaa","aaba", "abba", "bbba"),       ) 


q()
y

#####################################################################

#FACTORS 



library(tidyverse)
library(forcats)

# FACTORS with FORCATS   Chapter 12

# Factors in R are used to process categorical variables that have a
# set number of types or levels that they can take on.  For example 
# consider a created character variable Oceans; there is a set number
# of Oceans, namely, Pacific, Atlantic, Indian, Southern, and Artic.
# We will use the forcats package to process and perform various 
# operations that involve factors

# Let's create a factor.  We will consider a variable that records 
# units of time.
x1<- c("weeks","days","months")
x1

# A sensible ordering would be with respect to length or duration. A
# year is longer than a month, a week is longer than a day and so 
# forth.

# Note that a normal sort arranges these elements alphabetically, 
# which is not that useful

sort(x1)

# A sorting with regards to duration would be more beneficial. By 
# creating a factor we will be able to do so.

# Lets create a Factor !!

# Step 1  Create a list of possible levels. In this case, listed
# according to duration from largest to smallest.

Timeunits<- c("years", "months", "weeks" , "days" , "hours" , 
              "minutes" , "seconds")
Timeunits

# Step 2   Now create a factor using the R command,  factor. Assign
# the factor expression to a variable

x2 <- factor(x1,  levels = Timeunits)
x2

#  Now sort on the created factor that is assigned  x2.

sort(x2)

# Note that the elements are now sorted with regards to duration size.


# An element that is not in the grouping  will be converted to NA. Note that in
# the following vector there is a mispelling ; monthss is not in the
# original set.

x3 <-  c("weeks" , "days" , "monthss")
x3

# Lets create a factor using the set with the error

x4 <- factor(x3,  levels = Timeunits)
x4

# Note that the error has been defaulted to  NA



# By using the argument levels = unique(x), you return the original
# vector.  Recall that x1 was initially defined as follows:
# x1<- c("weeks","days","months")
# x1

factor(x1)


factor(x1, levels = unique(x1))  


# In order to get practice with factors in a variety of ways, we
# will consider the gss_cat data frame that contains responses to
# a major survey conducted by the NORC organization that's affiliated 
# with the University of Chicago.

gss_cat

# By looking at the tibble output for gss_cat, we cannot immediately
# determine the number of levels for certain categorical variables.
# The tibble for gss_cat only shows one level for race;  white

# Lets find out what the other levels are by using the command :
# count

gss_cat%>%
  count(race)

# Their are three levels and the code also gives the frequency for
# each level.

# We can also determine how many levels exists for a categorical 
# variable by generating a bar graph.

ggplot(data = gss_cat) +
  geom_bar(mapping = aes(x= race, fill=race))

# ggplot will not show output for levels that do not have values.
# If you want those levels displayed also you must use the code
#  scale_x_discrete(drop = FALSE)


ggplot(data = gss_cat) +
  geom_bar(mapping = aes(x= race, fill =race)) +
  scale_x_discrete(drop = FALSE)


# Reordering the levels of factor can lead to a graph that is easier
# to interpret.

# Ewample 1   
# From the gss_cat data, lets generate a scatter plot showing a 
# relationship between religion and the average number of hours for
# watching television

# Run this data chunk to get the data frame

gss_cat%>%
  group_by(relig)%>%
  summarize(tvhours = mean(tvhours, na.rm = TRUE),
            n=n()
  ) -> religtv
religtv

# Now run this data chunk to get the scatter plot

ggplot(data = religtv) +
  geom_point(mapping = aes(x=tvhours,
                           y = relig)) 

# Note that the scatter plot is somewhat difficult to interpret if 
# you are trying to compare or generalize about mean tv hours per
# religion.



# Now lets improve on the scatter plot for interpretation by using 
# the function  fct_reorder. Note that it is coded with the dependent
# variable and the independent variable

ggplot(data = religtv) +
  geom_point(mapping = aes(x=tvhours,
                           y = fct_reorder(relig,tvhours)))

# Now we have a plot that readily gives an order for religions with 
# regard to average hours of television watched.  What religious
# category has the highest mean tv watching value?


# For bar plots, we can order levels with the coding fct_infreq().
# This function will order levels with regard to frequency.


# Run both code chunks
gss_cat%>%
  mutate(marital= fct_infreq(marital)) -> gssm
gssm

ggplot(data = gssm) +
  geom_bar(mapping = aes(x= (marital)))

# Note that the levels for the factor marital are ordered according to
# frequency in descending order.

# We can also order with regards to ascending order if we apply the
# command  fct_rev to the ggplot coding chunk


ggplot(data = gssm) +
  geom_bar(mapping = aes(x= fct_rev(marital)))


# Lets use the partyid factor of the gss_cat data to illustrate how 
# levels can be modified.  


# Lets change the level Not str democrat to weak democrat by using 
# the function fct_recode.
gss_cat

library(dplyr)

gss_cat%>%
  select(marital, partyid) -> gss1
gss1

gss1%>%
  mutate(partyid = fct_recode(partyid, 
                              "weak democrat" = "Not str democrat"))

# In line 5 of the output, note that we now have the entry for party
# id of "weak democrat".

# Another interesting function to consider is fct_lump. Use this 
# command if you want to lump together all the small groups into one
# group in order to make a table simpler.

#  Hence, we are trying to condense or improve on the following table:
gss_cat%>%
  select(relig)%>%
  count(relig)


# We will use this function to merge the smaller groups of the 
# relig factor as follows:

gss_cat%>%
  mutate(relig = fct_lump(relig))%>%
  count(relig)

# Now suppose that we feel that we have gone to far and would like a table that is more
# descriptive

gss_cat%>%
  mutate(relig = fct_lump(relig, n = 10))%>%
  count(relig, sort = TRUE)


gss_cat%>%
  mutate(relig = fct_lump(relig, n = 10))%>%
  count(relig)%>%
  arrange(desc(n))




# Text book problem
# We now examine the levels of the variable partyid
gss_cat%>%
  select(partyid)%>%
  count(partyid)

# We may decide that there are too many of them and that they should be collapsed 
# or re-structured


gss_cat%>%
  mutate(partyid = fct_collapse(partyid,
                                other = c("No answer", "Don't know", "Other party"),
                                rep = c("Strong republican", "Not str republican"),
                                ind = c("Ind,near rep", "Independent",  "Ind,near dem"),
                                dem = c("Not str democrat", "Strong democrat")))%>%
  count(partyid)



q()
y









