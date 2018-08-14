#setwd("/path/to/R/project")
setwd("C:/Users/jpmar/Google Drive/JournalismCourses.org/RC0818 - R for Journalists - How to Find Great Stories in Data/project NSW crime")
#setwd("C:/Users/johnpaul.mariano/Google Drive/JournalismCourses.org/RC0818 - R for Journalists - How to Find Great Stories in Data/project NSW crime")

library(readr)
library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)

# load data
#data <- read.csv('PostcodeData2017.csv', header=T)
data <- read_csv('PostcodeData2017.csv')

# check out structure 
str(data)
dim(data)
#View(data)

head(data)

# make tall
df1 <- data %>% gather(month.year, value='count', 4:279)
head(df1)
tail(df1)

# split year and month
df2 <- df1 %>% mutate(year=str_split(month.year, ' ', simplify=TRUE)[,2],
                      month=str_split(month.year, ' ', simplify=TRUE)[,1]) 
head(df2)

# select and rename columns
df3 <- df2 %>% select(postcode=Postcode, cat=`Offence category`, subcat=Subcategory, year, month, count)
head(df3)


#write_csv(df3, 'crimes.csv')





