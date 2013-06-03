library(ggplot2)

cost <- read.csv("Medicare_Provider_Charge_Inpatient_DRG100_FY2011.csv", colClasses = "character")
quality <- read.csv("Outcome of Care Measures.csv", colClasses = "character")

## in the cost table, Provider.Id is missing leading 0's for strings of length 5
## add back leading 0's 
cost[nchar(cost$Provider.Id) == 5, "Provider.Id"] <- paste0("0", cost[nchar(cost$Provider.Id) == 5, "Provider.Id"])

## extract only columns and rows of interest
to_match <- c("heart failure", "acute myocardial infarction", "pneumonia")
cost_sub <- cost[grep(paste(to_match, collapse="|"), cost$DRG.Definition, ignore.case = T), c(1, 2, 3, 6, 11)]
quality_sub <- quality[, c(1, 11, 17, 23, 29, 35, 41)]

## merge data
cost_quality <- merge(cost_sub, quality_sub, by.x = "Provider.Id", by.y = "Provider.Number")

## change column names and classes
names(cost_quality) <- c('id', 'drg', 'name', 'state', 'avg.payment', 'ami.mort', 'hf.mort', 'pn.mort', 'ami.read', 'hf.read', 'pn.read')
cost_quality[, c(5:11)] <- apply(cost_quality[, c(5:11)], 2, as.numeric)

## exploratory graphs
ggplot(cost_quality, aes(x = ami.mort, y = avg.payment)) + geom_point() + facet_wrap(~drg)
