#CaseStudy: https://www.kaggle.com/datasets/rtatman/chocolate-bar-ratings
#As part of the data science team at Gourmet Analytics, you use data analytics to advise companies in the food industry. You clean, organize, and visualize data to arrive at insights that will benefit your clients. As a member of a collaborative team, sharing your analysis with others is an important part of your job. 
#Your current client is Chocolate and Tea, an up-and-coming chain of cafes. 
#The eatery combines an extensive menu of fine teas with chocolate bars from around the world. Their diverse selection includes everything from plantain milk chocolate, to tangerine white chocolate, to dark chocolate with pistachio and fig. The encyclopedic list of chocolate bars is the basis of Chocolate and Tea’s brand appeal. Chocolate bar sales are the main driver of revenue. 
#Chocolate and Tea aims to serve chocolate bars that are highly rated by professional critics. They also continually adjust the menu to make sure it reflects the global diversity of chocolate production. The management team regularly updates the chocolate bar list in order to align with the latest ratings and to ensure that the list contains bars from a variety of countries. 
#They’ve asked you to collect and analyze data on the latest chocolate ratings. In particular, they’d like to know which countries produce the highest-rated bars of super dark chocolate (a high percentage of cocoa). This data will help them create their next chocolate bar menu. 
#Your team has received a dataset that features the latest ratings for thousands of chocolates from around the world. Click here to access the dataset. Given the data and the nature of the work you will do for your client, your team agrees to use R for this project. 

library(tidyverse)
chocolate<-read_csv('flavors_of_cacao.csv')
View(chocolate)

#Change column 1's name for clarity and consistency
chocolate <- chocolate %>% rename('CompanyName'=colnames(chocolate[1]),'CocoaMix'=colnames(chocolate[5]),'Location'=colnames(chocolate[6]))

#Keep the most relevent variables & summarize the data
chocolate_analysis <- chocolate %>% select(Rating,CocoaMix,CompanyName,Location) 
chocolate_analysis %>% summarize(avg_rating=mean(Rating),sd_rating=sd(Rating),min_rating=min(Rating),max_rating=max(Rating))

#After completing your analysis of the rating system, you determine that any rating greater than or equal to 3.75 points can be considered a high rating. 
#You also know that Chocolate and Tea considers a bar to be super dark chocolate if the bar's cocoa percent is greater than or equal to 80%. 
#You decide to create a new data frame to find out which chocolate bars meet these two conditions. 
selection <-chocolate_analysis %>% filter(Rating >=3.75 & CocoaMix>=80)

#Now that you’ve cleaned and organized your data, you’re ready to create some useful data visualizations. Your team assigns you the task of creating a series of visualizations based on requests from the Chocolate and Tea management team.
#You decide to use ggplot2 to create your visuals. 
selection %>% ggplot(aes(x=Location))+geom_bar(aes(fill=Rating))+labs(title="Selection by Location")
