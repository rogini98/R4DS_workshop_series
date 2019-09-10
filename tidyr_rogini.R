#-------------------------------------
# R-ladies Rscript
#------------------------------------------------
# Source: Data Science in R by Garrett Grolemund
#------------------------------------------------
# The purpose of this script is
# show how to tidy messy data using
# tidyr package
#-------------------------------------

# upload the libraries we are going to use here
library(tidyr)
library(devtools)

# install package containing the data that we will be using for this part
# devtools::install_github("garrettgman/DSR")
library(DSR)

# have a look at your data
# feel free to use whatever commands we showed from the previous session to checkout your data
head(table1) 
head(table2)
head(table3)
head(table4)
head(table5)

#-------------------------------------------------------------------------------
# according to the definition that we previously gave about a tidy dataset
# would you say that the above datasets are tidy? 

# using the verbs in tidyr
#gather, spread, separate, unite

# gather values which were spread over columns underneath 1 column
## use either table4 or table5
table4
gather(table4, "year", "population", 2:3)
gather(table5, "year", "population", 2:3)

# spread: opposite to gather()
## spread values which were on multiple rows into multiple columns
table2
spread(table2, key, value)

# separate: split values within one column into multiple columns
table3
separate(table3, rate, into = c("cases", "population"))
separate(table3, rate, into = c("cases", "population"), sep = "/")

# unite: combines multiple columns into 1
table6
# combine/merge the century and year into one column
unite(table6, "completeyear", century, year, sep = "")
#-------------------------------------------------------------------------------
# it's your turn now!
View(who)
head(who)
tail(who)

# move the values into their own column with gather()
tidy_who <- gather(who, "code", "value", 5:60)

# separate the values in each code with two passes of separate()
## first pass: separate code
tidy_who <- separate(who, code, c("new", "var", "sexage"))

## second pass: split sexage after the first character to create a sex column and an age column.
tidy_who <- separate(who, sexage, c("sex", "age"), sep = 1)

# we can move the rel, ep, sn, and sp keys into their own column names with spread().
tidy_who <- spread(who, var, value)
