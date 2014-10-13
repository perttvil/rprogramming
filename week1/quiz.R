x <- read.csv('hw1_data.csv')
x[1:6,]
ozone <- x[,1]
length(ozone[is.na(ozone)])
ozoneN <- ozone[!is.na(ozone)]
mean(ozoneN)
#muuta NA => nollaksi
ozone[is.na(ozone)] <- 0
ozone31 <- ozone > 31
temp <- x[,4]
temp[is.na(temp)] <- 0
#muuta NA => nollaksi
tempN <- temp[!is.na(temp)]
temp90 <- temp > 90
#Q18
subset1 <- x[complete.cases(ozone31,temp90),]
solarR <- subset1[,2]
solarRN <- solarR[!is.na(solarR)]
q18 <- mean(solarRN)
#q19
month <- x[5]
month == 6
q19 <- mean(x[month==6,4])
#q20
month5Temp<- x[month==5,1]
month5TempN <- month5Temp[!is.na(month5Temp)]
q20 <- max(month5TempN)