# Notenschnitt einer bestimmten Prüfung
getMeanOfExam <- function(con, examID) {
  sqlStatement <-
    sprintf(
      "SELECT grade FROM studentmanager_grimmeisen_scholtz.studentmanager_result WHERE exam_id_id = '%s'",
     examID
    )
  gradeFrame <- dbGetQuery(con, sqlStatement)
  if (is.data.frame(gradeFrame) && ncol(gradeFrame) > 0) {
    mean(gradeFrame[, "grade"])
  } else {
    0
  }
}

# Alle Noten einer bestimmten Prüfung
getGradesOfExam <- function(con, examID) {
  sqlStatement <-
    sprintf(
      "SELECT grade FROM studentmanager_grimmeisen_scholtz.studentmanager_result WHERE exam_id_id = '%s'",
      examID
    )
  gradeFrame <- dbGetQuery(con, sqlStatement)
  if (is.data.frame(gradeFrame) && ncol(gradeFrame) > 0) {
    gradeFrame[, "grade"]
  } else {
    0
  }
}
  


