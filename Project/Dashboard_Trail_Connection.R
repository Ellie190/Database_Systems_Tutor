## Database Server connection 
library(RMySQL)
con <- dbConnect(RMySQL::MySQL(),
                 dbname = "employees",
                 host = "localhost",
                 port = 3306,
                 user = "CTO",
                 password = "PiE2mo@RdressZ99")
