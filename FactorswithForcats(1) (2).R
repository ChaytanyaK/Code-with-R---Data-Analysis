

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
  
  
  
  

