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
getMeanOfAllStudents <- function(con, removeZeroes = TRUE) {
  #con <- connecttodb()
  sqlStatementgrades <-
    sprintf(
      "SELECT matriculation_number_id as matriculation_number, grade
      FROM studentmanager_grimmeisen_scholtz.studentmanager_result"
    )
  gradeFrame <- dbGetQuery(con, sqlStatementgrades)
  #print(gradeFrame)
  
  sqlStatementstudents <-
    sprintf(
      "SELECT DISTINCT matriculation_number
      FROM studentmanager_grimmeisen_scholtz.studentmanager_student"
    )
  studentFrame <- dbGetQuery(con, sqlStatementstudents)
  
  if (is.data.frame(gradeFrame) &&
      ncol(gradeFrame) == 2 &&
      is.data.frame(studentFrame) && ncol(studentFrame) == 1) {
    uniquestudents <- unique(studentFrame[, 'matriculation_number'])
    #uniquestudents
    #print(uniquestudents)
    studentmean <-
      data.frame(
        Student = character(),
        Mean = double(),
        stringsAsFactors = FALSE
      )
    for (student in uniquestudents) {
      meanofstudent <- getMeanOfStudent(con, student)
      if (removeZeroes == TRUE) {
        if (meanofstudent > 0) {
          studentmean[nrow(studentmean) + 1, ] = list(as.character(student), meanofstudent)
        }
      } else if (removeZeroes == FALSE) {
        studentmean[nrow(studentmean) + 1, ] = list(as.character(student), meanofstudent)
      }
    }
  }
  return (studentmean)
}

# Median der Notenschnitte
getMedianOfGrades <- function(con, removeZeroes = TRUE) {
  Studentmean <-
    getMeanOfAllStudents(con, removeZeroes = removeZeroes)
  if (is.data.frame(Studentmean) && ncol(Studentmean) == 2) {
    median(Studentmean[, "Mean"])
  } else {
    0
  }
}

#Standardabweichung der Notenschnitte
getSdOfGrades <- function(con, removeZeroes = TRUE) {
  Studentmean <-
    getMeanOfAllStudents(con, removeZeroes = removeZeroes)
  if (is.data.frame(Studentmean) && ncol(Studentmean) == 2) {
    sd(Studentmean[, "Mean"])
  } else {
    0
  }
}
