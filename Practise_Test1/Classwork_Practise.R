#PRACTISE TEST 
#GGPLOT PRACTISE 
library(tidyverse)
library(dplyr)
library(ggplot2)
install.packages("nycflights13")
library(nycflights13)
#view(mpg)

#Question1
ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y=cty))

#Question2

ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y=cty, color = fl))

#Question3

ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y=cty),color ="green")

#Question4 

ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y=cty,shape=class))+
  ggtitle("City vs Highway")+
  xlab("Highway")+
  ylab("City")

#Question5

ggplot(data=mpg) +
  geom_smooth(mapping=aes(x=displ,y=cty)) 


#Question6


ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=cty)) +
  geom_smooth( mapping=aes(x=displ,y=cty,color=drv) )

#Question7

ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=cty)) +
  geom_smooth(method=lm, mapping=aes(x=displ,y=cty,color=drv) )

#Question8

ggplot(data=mpg) +
  geom_bar(mapping = aes(x= drv,fill=drv))+
  ggtitle("DRV Bar Graph")

#Question9 and Question10 - As discussed in the classs,Skipped. 

#Question11
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x=cut , y=price))



#Question12
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(y=price))+
  facet_grid(cut~color)

#Question13

ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=hwy),fill="blue")+
  ggtitle("Blue Histogram")


#PART2
  #Question1
x1<-filter(mpg,manufacturer=="dodge",model=="durango 4wd")  # (double =)
head(x1)

#Question2

x2<-filter(mpg, cty<10 & hwy<16)  # (double =)
head(x2)


#Question3

x3<-mpg%>%
arrange(desc(displ))
head(x3)


#Question4

x4<-mpg%>%
arrange((cty))%>%
print(n=30)

#"dakota pickup 4wd , durango 4wd , ram 1500 pickup 4wd (auto), ram 1500 pickup 4wd(manual), grand cherokee 4wd has the lowest city milege 

#Question5

 mpg%>%
filter(manufacturer=="ford",year==1999,cty<=16 & hwy<16)

#Question6
  
  mpg%>%
    filter(manufacturer=="ford",model=="mustang")%>%
    mutate(difference= hwy-cty)%>%
    select(manufacturer,model,cty,hwy,difference)

 # Question7
  flights
  ?flights
  view(flights)
  
  flights%>%
    filter(carrier=="AA",month==3 ,day==17 , year==2013)%>%
    select(carrier,year,month,day,arr_delay)%>%
    arrange(desc(arr_delay))
  
  #Question8
  
  mpg%>%
    filter(year==1999)%>%
    group_by(manufacturer,year==1999) %>%
    summarise(meanmilage=mean(cty))%>%
    arrange(desc(meanmilage))
  
  #Honda has got the best average gas milege in 1999
 
    

  
  