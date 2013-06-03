library(ggplot2)
library(reshape2)

## make sure .csv files are in the same folder as your working directory
cost <- read.csv("Medicare_Provider_Charge_Inpatient_DRG100_FY2011.csv", colClasses = "character")
quality <- read.csv("Outcome of Care Measures.csv", colClasses = "character")

## in the cost table, Provider.Id is missing leading 0's for strings of length 5
## add back leading 0's 
cost[nchar(cost$Provider.Id) == 5, "Provider.Id"] <- paste0("0", cost[nchar(cost$Provider.Id) == 5, "Provider.Id"])

## extract only columns and rows of interest
to_match <- c("heart failure", "acute myocardial infarction", "pneumonia")
cost_sub <- cost[grep(paste(to_match, collapse="|"), cost$DRG.Definition, ignore.case = T), c(1, 2, 3, 6, 11)]

## separate mortality and readmissions into two tables
quality_mort <- quality[, c(1, 11, 17, 23)]
quality_read <- quality[, c(1, 29, 35, 41)]

## making an assumption that costs associated with patients who have died will be greater than those those who survived
## for this reason, we'll only look at the most severe DRGs (i.e. those 'W MCC', which stands for 'with major 
## complications and comorbidities')
cost_sub <- cost_sub[grep("W MCC", cost_sub$DRG.Definition), ]

## rename columns
names(quality_mort) <- c('id', 'ami', 'hf', 'pn')
names(quality_read) <- c('id', 'ami', 'hf', 'pn')
names(cost_sub) <- c("cond", 'id', 'name', 'state', 'avg.payment')

## reshape and merge mortality and readmissions data together
quality_mort <- melt(quality_mort, id = c("id"), value.name = "mortality", variable.name = "cond")
quality_read <- melt(quality_read, id = c("id"), value.name = "readmissions", variable.name = "cond")
quality_sub <- merge(quality_mort, quality_read, by = c("id", "cond"))

## rename drgs, match, and merge cost with quality data
cost_sub$cond[cost_sub$cond == "193 - SIMPLE PNEUMONIA & PLEURISY W MCC"] <- "pn"
cost_sub$cond[cost_sub$cond == "280 - ACUTE MYOCARDIAL INFARCTION, DISCHARGED ALIVE W MCC"] <- "ami"
cost_sub$cond[cost_sub$cond == "291 - HEART FAILURE & SHOCK W MCC"] <- "hf"
cost_quality <- merge(cost_sub, quality_sub, by = c("id", "cond"))

## change column names and classes
cost_quality[, c(5:7)] <- apply(cost_quality[, c(5:7)], 2, as.numeric)

## exploratory graph
ggplot(cost_quality, aes(x = mortality, y = avg.payment)) + 
  geom_point(alpha = .3) + 
  facet_grid(~cond)

ggplot(cost_quality, aes(x = readmissions, y = avg.payment)) + 
  geom_point(alpha = .3) + 
  facet_grid(~cond)
