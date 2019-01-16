# install.packages("RPostgreSQL")
require("RPostgreSQL")

connecttodb <- function() {
  # create a connection
  # save the password that we can "hide" it as best as we can by collapsing it
  pw <- {
    "WS18WIC13"
  }
  
  # loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  # creates a connection to the postgres database
  # note that "con" will be used later in each connection to the database
  con <- dbConnect(
    drv,
    dbname = "Datenbank WIC",
    host = "193.93.243.162",
    port = 5432,
    user = "WICWS1813",
    password = pw
  )
  rm(pw) # removes the password
  
  # check for the studentmanager_student table
  studentTableExists <-
    dbExistsTable(con,
                  "studentmanager_grimmeisen_scholtz.studentmanager_student")
  
  return (con)
}

killDbConnections <- function () {
  all_cons <- dbListConnections(drv)
  
  
  print(all_cons)
  
  for (con in all_cons)
    +  dbDisconnect(con)
  
  print(paste(length(all_cons), " connections killed."))
  
}

getAllData <- function() {
  con <- connecttodb()
  
  sqlStatement <- "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_student"
  studentFrame <- dbGetQuery(con, sqlStatement)
  
  sqlStatement <- "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_exam"
  examFrame <- dbGetQuery(con, sqlStatement)
  
  sqlStatement <- "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_result"
  resultFrame <- dbGetQuery(con, sqlStatement)
  
  if (dbDisconnect(conn = con)) {
    print('SUCCESFULLY DISCONNECTED FROM DB!')
  } else {
    print('ERROR WHILE DISCONNECTING FROM DB!')
  }
  
  return (list(StudentFrame = studentFrame, ExamFrame = examFrame, ResultFrame = resultFrame))
}
