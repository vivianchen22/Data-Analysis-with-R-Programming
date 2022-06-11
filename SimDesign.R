install.packages("SimDesign")
library("SimDesign")

#See if the weather prediction is biased
#The bias function compares the actual outcome and the predicted outcome of the data. 
#The closer to 0, the better
actual_temp <- c(68,70,72,74,75)
fcst_temp <- c(70,70.5,73,74,75)
bias(actual_temp,fcst_temp)

#The bias function compares the actual outcome and the predicted outcome of the data to determine the average amount of the actual outcome is greater than the predicted outcome
actual_sales <- c(1000,2000,3000,4000,5000)
fcst_sales <- c(100,200,300,400,500)
bias(actual_sales,fcst_sales)
