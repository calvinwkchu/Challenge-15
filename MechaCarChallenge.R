library(dplyr)

# Deliverable 1
mechacar_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #import MechaCar data set

mechacar_lm = lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table) #generate multiple linear regression model

summary(mechacar_lm) #summarize linear regression

# Deliverable 2

coil_table <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) #import suspension coil data set

total_summary = coil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) #create total summary

lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create lot summary table

# Deliverable 3

t.test(coil_table$PSI,mu=1500) #t-test for all lots in coil table

t.test(subset(coil_table$PSI, coil_table$Manufacturing_Lot == 'Lot1'),mu=1500,) #t-test for lot#1
t.test(subset(coil_table$PSI, coil_table$Manufacturing_Lot == 'Lot2'),mu=1500,) #t-test for lot#2

t.test(subset(coil_table$PSI, coil_table$Manufacturing_Lot == 'Lot3'),mu=1500,) #t-test for lot#3

