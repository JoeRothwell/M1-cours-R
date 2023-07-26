# Epitools. From https://rstudio-pubs-static.s3.amazonaws.com/857563_57836bbe942a424d8112826c9710eb1d.html
library(epitools)

Table1 <- matrix(c(11, 36, 518, 517), nrow = 2, ncol = 2)
Table1
##      [,1] [,2]
## [1,]   11  518
## [2,]   36  517

riskratio.wald(Table1, rev = c("both"))
epitab(Table1)
