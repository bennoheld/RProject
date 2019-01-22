# This file contains all functions that are used to establish a connection to the database
# Authors: Benedikt Grimmeisen


require("RPostgreSQL")

ConnectToDB <- function() {
  # Establishes a connection to the configured PostgreSQL database.
  #
  # Returns:
  #   The PostgreSQLConnection object to the student database
  
  # save the password that we can "hide" it as best as we can by collapsing it
  pw <- {
    "WS18WIC13"
  }
  
  # loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  
  # creates a connection to the postgres database
  con <- dbConnect(
    drv,
    dbname = "Datenbank WIC",
    host = "193.93.243.162",
    port = 5432,
    user = "WICWS1813",
    password = pw
  )
  rm(pw) # removes the password
  
  return (con)
}

KillAllDBConnections <- function () {
  # Closes all open database connections.
  
  all_cons <-
    dbListConnections(drv) # get list of all open connections
  
  for (con in all_cons) {
    dbDisconnect(con) # disconnect every connection
  }
  
  print(paste(length(all_cons), " connections killed."))
}

LoadAllData <- function() {
  # Loads all data for students, exams and results from the connected database
  #
  # Returns:
  #   A List containing a StudentFrame, ExamFrame and ResultFrame
  
  con <- ConnectToDB() # open connection to the database
  
  sqlStatement <-
    "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_student"
  studentFrame <-
    dbGetQuery(con, sqlStatement)  # load all data from student table
  
  # check studentFrame data
  if (!is.data.frame(studentFrame) ||  ncol(studentFrame) != 3) {
    stop("Student data could not be loaded properly!")
  }
  
  sqlStatement <-
    "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_exam"
  examFrame <-
    dbGetQuery(con, sqlStatement)  # load all data from exam table
  
  # check examFrame data
  if (!is.data.frame(examFrame) ||  ncol(examFrame) != 3) {
    stop("Exam data could not be loaded properly!")
  }
  
  sqlStatement <-
    "SELECT * FROM studentmanager_grimmeisen_scholtz.studentmanager_result"
  resultFrame <-
    dbGetQuery(con, sqlStatement)  # load all data from result table
  
  # check resultFrame data
  if (!is.data.frame(resultFrame) ||  ncol(resultFrame) != 4) {
    stop("Result data could not be loaded properly!")
  }
  
  # try to close the database connection
  if (dbDisconnect(conn = con)) {
    print('SUCCESFULLY DISCONNECTED FROM DB!')
  } else {
    print('ERROR WHILE DISCONNECTING FROM DB!')
  }
  
  return (list(
    StudentFrame = studentFrame,
    ExamFrame = examFrame,
    ResultFrame = resultFrame
  ))
}
