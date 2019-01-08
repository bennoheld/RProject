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
