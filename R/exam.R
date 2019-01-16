# Notenschnitt einer bestimmten Prüfung
getMeanOfExam <- function(resultFrame, examID) {
  mean <- 0
  if (is.data.frame(resultFrame) && ncol(resultFrame) ==  4) {
    mean <- mean(subset(resultFrame, exam_id_id == examID)$grade)
  } 
  return (round(mean, digits = 2))
}

# Alle Noten einer bestimmten Prüfung
getGradesOfExam <- function(resultFrame, examID) {
  if (is.data.frame(resultFrame) && ncol(resultFrame) ==  4) {
    allGrades <- subset(resultFrame, exam_id_id == examID)$grade
    return (list(Exam = examID, Grades = allGrades))
  } else {
    return (list(Exam = examID, Grades = numeric(0)))
  }
}
