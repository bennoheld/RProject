#source("dbconnect.R")

# Notenschnitt eines bestimmten Studierenden
getMeanOfStudent <- function(resultsFrame, matriculationNumber) {
  mean <- 0
  
  if (is.data.frame(resultsFrame) && ncol(resultsFrame) > 0) {
    mean <- (mean(subset(resultsFrame, matriculation_number_id == matriculationNumber)$grade))
  } 
  
  return (mean)
}

# Alle Noten eines bestimmten Studenten
getGradesOfStudent <- function(resultsFrame, matriculationNumber) {
  if (is.data.frame(resultsFrame) && ncol(resultsFrame) ==  4) {
    return (subset(resultsFrame, matriculation_number_id == matriculationNumber)$grade)
  } else {
    return (numeric(0))
  }
}

getMeanOfAllStudents <- function(data) {
  studentmean <-
    data.frame(
      Student = character(),
      Mean = double(),
      stringsAsFactors = FALSE
    )
  uniqueStudents <- data[[1]]$matriculation_number
  for (matriculationNumber in uniqueStudents) {
    meanOfStudent <- getMeanOfStudent(data[[3]], matriculationNumber)
    if(!is.nan(meanOfStudent) && is.numeric(meanOfStudent)) {
      studentmean[nrow(studentmean) + 1, ] = list(as.character(matriculationNumber), meanOfStudent)
    }
  }
  
  return (studentmean)
}

getMedianOfAllStudents <- function(data) {
  median <- 0
  
  meanAllStudents <-
    getMeanOfAllStudents(data)
  if (is.data.frame(meanAllStudents) && ncol(meanAllStudents) == 2) {
    median <- median(meanAllStudents[, "Mean"])
  } 
  return (mean)
}

getSdOfAllStudents <- function(data) {
  sd <- 0
  meanAllStudents <-
    getMeanOfAllStudents(data)
  if (is.data.frame(meanAllStudents) && ncol(meanAllStudents) == 2) {
    sd <- sd(meanAllStudents[, "Mean"])
  } 
  return (sd)
}