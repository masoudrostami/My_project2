
###################### Data mining


install.packages("tidyverse")

library(tidyverse)

library(dplyr)

library(tidyr)


#########


harp <- read_csv("harp.csv")

harp

View(harp)



###########################################  1) Tidy data





################# 1.1. Melting/Pivoting longer/ Stacking

?table4a
table4a # Cases

table4b #Population

table1

table2


table3

table5

#### make tidy format

table4atidy <- table4a%>%pivot_longer(cols =c("1999","2000"),names_to = "year",values_to = "cases" )

# cols   column we are bring down, names_to  variable given to columns,   valuesvariable given to the values




        
        
table4btidy <-table4a%>%pivot_longer(cols=-country,names_to = "year",values_to ="population")



############ 2) Join 2 dataframes

# left join

left_join(table4atidy,table4btidy )


inner_join(table4atidy,table4btidy )

right_join(table4atidy,table4btidy )


left_join(table4atidy,table4btidy )%>%select(country, year, population, cases)




##########3) binding

x=1:10

y=letters[1:10]


tbl <- bind_cols(x,y)
tbl

colnames(tbl)




############# 3) Casting/Pivoting Wider/Unstacking


table2


table2%>%pivot_wider(id_cols = c("country","year"),names_from = type,values_from=count)


table2%>%pivot_wider(id_cols = c("country"))




########### String manipulation


library(stringr)


table3


table3sep <- table3%>%separate(col=rate, into=c("cases", "population"), sep= "/")


table3sep%>%unite("rate", cases, population, sep="/", remove=FALSE)



tidytable1000 <- table3%>%separate(col=rate, into=c("cases", "population"),
                  sep= "/", remove=TRUE)%>%mutate(cases=as.integer(cases), population=as.integer(population))%>%mutate(rate=cases/population)%>%
        mutate(rate_per100k=rate*1e5)


glimpse(tidytable1000 )

















