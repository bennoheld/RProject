#source("dbconnect.R")

# Notenschnitt eines bestimmten Studierenden
getMeanOfStudent <- function(con, matriculationNumber) {
  sqlStatement <-
    sprintf(
      "SELECT grade FROM studentmanager_grimmeisen_scholtz.studentmanager_result WHERE matriculation_number_id = '%s'",
      matriculationNumber
    )
  gradeFrame <- dbGetQuery(con, sqlStatement)
  if (is.data.frame(gradeFrame) && ncol(gradeFrame) > 0) {
    mean(gradeFrame[, "grade"])
  } else {
    0
  }
}

# Alle Noten eines bestimmten Studenten
getGradesOfStudent <- function(con, matriculationNumber) {
  sqlStatement <-
    sprintf(
      "SELECT grade FROM studentmanager_grimmeisen_scholtz.studentmanager_result WHERE matriculation_number_id = '%s'",
      matriculationNumber
    )
  gradeFrame <- dbGetQuery(con, sqlStatement)
  if (is.data.frame(gradeFrame) && ncol(gradeFrame) > 0) {
    gradeFrame[, "grade"]
  } else {
    0
  }
}

# Notenschnitte aller Studierenden
getMeanOfAllStudents <- function(con) {
    #con <- connecttodb()
  sqlStatement <-
    sprintf(
      "SELECT matriculation_number_id as matriculation_number, grade
      FROM studentmanager_grimmeisen_scholtz.studentmanager_result"
    )
  gradeFrame <- dbGetQuery(con, sqlStatement)
  #print(gradeFrame)
  
  if (is.data.frame(gradeFrame) && ncol(gradeFrame) == 2) {
    uniquestudents <- unique(gradeFrame[, 'matriculation_number'])
    #uniquestudents
    #print(uniquestudents)
    for (student in uniquestudents) {
      print(getMeanOfStudent(con, student))
    }
  } else {
    0
  }
}