
#CHAPTER EIGHT  Data Import with readr

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


