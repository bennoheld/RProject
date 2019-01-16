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
    return (subset(resultFrame, exam_id_id == examID)$grade)
  } else {
    return (numeric(0))
  }
}
