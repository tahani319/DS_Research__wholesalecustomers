#Wholesales customers analysis
#Tahani AlHarbi
#09.10.2020

# Data from: https://www.kaggle.com/binovi/wholesale-customers-data-set

#load packages
library(tidyverse)

#data 
#The dataset  refers to clients of a wholesale distributor.
#It includes the annual spending in monetary units (m.u.) 
#on diverse product categories
#channel 1 #Horeca channel2 #Retail  
#region  #1 Lisbon #2 Porto  #3 other region 


# Read the data
wholesale_customers <- read.csv("data/wholesalecustomers.csv")
wholesale_customers <- as_tibble(wholesale_customers)

#explore data
glimpse(wholesale_customers)
summary(wholesale_customers)
wholesale_customers

#check if there is any missing values 

sum(is.na(wholesale_customers))

#There is no missing values 


#change channel and region into factors 
wholesale_customers$Region <-  as.factor(wholesale_customers$Region) 
wholesale_customers$Channel <-  as.factor (wholesale_customers$Channel)
nlevels(wholesale_customers$Region)
nlevels(wholesale_customers$Channel)



#rename Region 1, 2 and 3 to 
#Lisbon Porto  and Other_Region

levels(wholesale_customers$Region) <- c("Lisbon", "Porto", "Other_Region")

#rename Channel 1 to Horeca  and 2 to Retail

levels(wholesale_customers$Channel) <- c ("Horeca", "Retail")


# see the proportion of 2 channels  Horica and Retail in the Data 

ggplot(wholesale_customers, aes(Channel)) +
  geom_bar(fill = "#DD8888") 


#see the proportion of the Regions  

ggplot(wholesale_customers,aes(Region))+ geom_bar(fill="#DD8888")

#what the max and min cost in the datat 
wholesale_customers %>% summarise_if(is.numeric, max)
wholesale_customers %>% summarise_if(is.numeric, min)


# What is the range of Milk annual spending? 

rangespendmilk <- wholesale_customers %>%
  summarise(range(Milk))

rangespendmilk

# What is the range of Fresh annual spending? 

rangespendfresh <- wholesale_customers %>%
  summarise(range(Fresh))

rangespendfresh




#make Horeca dataset and Retail dataset 

customer_horeca <- wholesale_customers%>% filter(Channel=="Horeca")

customer_retail <- wholesale_customers %>% filter (Channel=="Retail")


#what the max and min cost in Horeca Channel? 

customer_horeca %>% summarise_if(is.numeric, max)
customer_horeca %>% summarise_if(is.numeric, min)


#what the max and min cost in Chanel Retail?

customer_retail %>% summarise_if (is.numeric, max)
customer_retail %>% summarise_if(is.numeric, min)




#What the annual spending of products through channel Horeca? 


#Milk
ggplot( aes(x=Milk), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")
#Fresh
ggplot( aes(x=Fresh), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")
#Grosery
ggplot( aes(x=Grocery), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")
#Frozen
ggplot( aes(x=Frozen), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")
#Detergents_Paper
ggplot( aes(x=Detergents_Paper), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")
#Delicassen
ggplot( aes(x=Delicassen), data=customer_horeca)+geom_histogram(binwidth = 10000, col="#AFC0CB")


