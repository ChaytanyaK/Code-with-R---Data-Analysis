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