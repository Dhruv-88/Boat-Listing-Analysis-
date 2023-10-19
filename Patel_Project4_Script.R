#DHRUV PATEL
#15TH OCTOBER,2023
#ALY 6000

cat("\014") # clears console
rm(list = ls()) # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # clears packages
options(scipen = 100) # disables scientific notation for entire R session
#library to use in Project 
library(tidyverse)
library(janitor)
library(lubridate, warn.conflicts = FALSE)
library(ggthemes)
library(ggeasy)
#Reading Dataset
df<-read_csv('boat_data.csv')

#cleanig dataset

#step 1 : cleaning column names.
df=df %>% clean_names()
df=df %>%
  drop_na() %>%
  filter(year_built!=0)


#step 2 :cleaning column Location
length(unique(df$location))

clean_location <- function(string){
  clean = unlist(strsplit(string," ")[1])
  return(clean[1])
}

df$location<-apply(data.frame(df$location),
                   1,
                   clean_location
                   )

#step 3 : cleaning boat_type

clean_boat<-function(string){
  clean = unlist(strsplit(string,",")[1])
  print(clean[1])
}

df$boat_type<-apply(data.frame(df$boat_type),
                    1,clean_boat
                    )
unique(df$boat_type)

#step 4 : cleaning price column

#-->making new columsn for price and currency
df<-separate(df,
             col=price,
             into=c('currency','price'),
             sep=' '
             )
unique(df$currency)

#-->removing entry with sign
df<-df %>% 
  filter(currency != "Â£")

#-->converting all currency to usd.
df$price<-as.numeric(df$price)
currencyCon <- function(x){
  
  
  values <- c(1.00, 0.94 , 0.90, 7.03)
  names(values) <- c("USD", "EUR", "CHF", "DKK")

  return(round(values["USD"] / (values[x[[2]]] / as.numeric(x[[1]]))))
 
}

usd_price<-apply(data.frame(df$price,df$currency),
           1,
           currencyCon
           )
#-->dropping price and currency column.
df= df %>% cbind(usd_price)
df= subset(df,select=-c(1,2))

#converting type column to reflect data ("new","Used","Disply")
#->remove colums that are not specified with type

df=subset(df,
           df$type != "Unleaded" & df$type != "Diesel" & df$type != "Electric"
           )

df$type<-apply(data.frame(df$type),
                   1,
                   clean_location
)


#checking for outliers :

ggplot(df,aes(x=width))+
  geom_boxplot()

df<-df %>% filter(width<6)

ggplot(df,aes(x=length))+
  geom_boxplot()

df<-df %>% filter(length<20 )

ggplot(df,aes(x=year_built))+
  geom_histogram()

df<-df %>% filter(year_built>1960)

ggplot(df,aes(x=material))+
  geom_bar()

#Q1 analysing country wise trend for boats
unique(df$location)

q1_df=df %>%
  group_by(location,boat_type) %>% 
  summarise(total_boat_listed=n(),
            avg_price_boat_listed=mean(usd_price),
            avg_length=mean(length),
            avg_width=mean(width),
            avg_year_built=round(mean(year_built)),
            avg_view = round(mean(number_of_views_last_7_days))
            ) %>% 
  filter(total_boat_listed>5) %>% 
  filter(avg_price_boat_listed<400000)


ggplot(q1_df,aes(x=avg_price_boat_listed))+
  geom_histogram()+labs(title="Price distribution")

ggplot(q1_df,aes(x=location,y=avg_price_boat_listed,fill="blue"))+
  geom_bar(stat="identity",position = 'dodge')

ggplot(q1_df,aes(x=boat_type,y=avg_price_boat_listed,fill="blue"))+
  geom_bar(stat="identity",position = 'dodge')+
  labs(x="boat_type",
       y="average price boat",
       title="boat type trend.")+
  easy_rotate_x_labels(angle = 45,
                       side="right",
                       teach = FALSE)


q1_df_2<-q1_df%>%
  group_by(location) %>%
  summarise(avg_price_for_category=mean(avg_price_boat_listed),
            total_boat_listed_category=sum(total_boat_listed))

ggplot(q1_df_2,aes(x=location))+
  geom_bar(aes(y=avg_price_for_category,fill=total_boat_listed_category),
           stat="identity",
           position="dodge"
           )+
  labs(x="Boat_type",
                  y="Average price boat",
                  title="Average price of boats in different country")+
  easy_rotate_x_labels(angle = 45,
                       side="right",
                       teach = FALSE)

q1_df_3<-q1_df %>%
  filter(location %in% c("France","Denmark","Germany","Italy","Netherlands","Switzerland"))

# q1_df_3 %>%
#   filter(location == 'France')

ggplot(q1_df_3,aes(x=boat_type))+
  geom_bar(aes(y=total_boat_listed,fill=avg_year_built),
           stat = 'identity',
           position = "dodge") + 
  easy_rotate_x_labels(angle = 45,
                       side="right",
                       teach = FALSE)+
  facet_wrap(vars(location))

ggplot(q1_df_3,aes(x=boat_type))+
  geom_bar(aes(y=avg_price_boat_listed,fill=avg_year_built),
           stat = 'identity',
           position = "dodge") + 
  easy_rotate_x_labels(angle = 45,
                       side="right",
                       teach = FALSE)+
  facet_wrap(vars(location))
  

#conclusion 
#some category in following country provide best price. and not all country has options to buy different category of boats.
#we can identify from the following graph where to look for the particular category.

#Q2 analysis pattern of listed average price.

q2_df_1<-df %>% group_by(location,boat_type,type) %>% 
  summarise(total_view=sum(number_of_views_last_7_days),
            average_price_listed=mean(usd_price)) %>%
  filter(total_view<10000 )

ggplot(q2_df_1,aes(x=total_view,y=average_price_listed,color=type))+
  geom_point()+
  labs(title="Total View comapre to price listed. ")

ggplot(q2_df_1,aes(x=boat_type,
                   y=average_price_listed,
                   fill=type
                   ))+
  geom_bar(stat = 'identity')+
  labs(title="avergae Price For each category.")+
  easy_rotate_x_labels(angle = 45,
                       side="right",
                       teach = FALSE)
  


  
  






















