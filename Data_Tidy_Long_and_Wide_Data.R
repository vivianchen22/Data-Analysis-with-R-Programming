library(tidyverse)


#data tidy from wide data to long data 
religion_income <- read_delim(
       "http://stat405.had.co.nz/data/pew.txt",
      delim = "\t"
   )
   
#way 1 by pivot_longer 
religion_income %>% pivot_longer(!religion,names_to="income",values_to = "count")

#way 2 by gather
religion_income %>% gather(key="income",value = "count",!religion)


#data tidy from long data to wide data
if (!file.exists("fishdata.csv")) {
      download.file(
           url = 'https://github.com/Myfanwy/ReproducibleExamples/raw/master/encounterhistories/fishdata.csv',
            destfile = "fishdata.csv"
        )
}

fish_encounters <- read_csv("fishdata.csv")

#way 1 by pivot_wider
fish_encounters %>% pivot_wider(names_from = Station,values_from=value,values_fill =0)

#way 2 by spread
fish_encounters %>% spread(key=Station,value=value,fill=0)




