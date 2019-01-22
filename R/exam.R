# This file contains all functions that process data related to exams.
# Authors: Benedikt Grimmeisen, Stefanie Scholtz

CalculateMeanOfExam <- function(resultFrame, examID) {
  # Calculates the arithmetic mean of a given examID.
  #
  # Args:
  #   resultFrame: Dataframe containing all grades for all exams.
  #   examID: Unique string identifier for the wanted exam.
  #
  # Returns:
  #   The arithmetic mean of all grades of the specified exam.
  
  if (is.data.frame(resultFrame) &&
      "grade" %in% colnames(resultFrame) &&
      "exam_id_id" %in% colnames(resultFrame)) {
    # filter dataframe by given examID, get grade column
    filteredResults = subset(resultFrame, exam_id_id == examID)
    
    # check if there ist data for this exam
    if (nrow(filteredResults) == 0) {
      stop("No grades found for specified examID!")
    }
    
    mean <-
      mean(filteredResults$grade) # calculate mean of filtered grade column
  } else {
    stop("Required columns are missing in the dataframe!")
  }
  return (round(mean, digits = 2))
}

GetGradesOfExam <- function(resultFrame, examID) {
  # Extracts all related grades of the specified examID.
  #
  # Args:
  #   x: Dataframe containing all grades for all exams.
  #   y: examID: Unique string identifier for the exam wanted.
  #
  # Returns:
  #   A list containing the examID as well as a vector with related grades
  
  if (is.data.frame(resultFrame) &&
      "grade" %in% colnames(resultFrame) &&
      "exam_id_id" %in% colnames(resultFrame)) {
    # filter resultframe by examID and get grade column
    allGrades <- subset(resultFrame, exam_id_id == examID)$grade
    
    return (list(Exam = examID, Grades = allGrades))
  } else {
    stop("Required columns are missing in the dataframe!")
  }
}
