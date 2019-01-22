# This file contains all functions that process data related to students
# Authors: Benedikt Grimmeisen, Stefanie Scholtz

CalculateMeanOfStudent <-
  function(resultFrame, matriculationNumber) {
    # Calculates the arithmetic mean of a given student
    #
    # Args:
    #   resultFrame: Dataframe containing all grades for all students.
    #   matriculationNumber: Unique string identifier for the wanted student
    #
    # Returns:
    #   The arithmetic mean of all grades of the specified student
    
    if (is.data.frame(resultFrame) &&
        "grade" %in% colnames(resultFrame) &&
        "matriculation_number_id" %in% colnames(resultFrame)) {
      # filter dataframe by given matriculationNumber, get grade column
      filteredResults = subset(resultFrame,
                               matriculation_number_id == matriculationNumber)
      
      # check if there ist data for this exam
      if (nrow(filteredResults) == 0) {
        stop("No grades found for specified matriculationNumber!")
      }
      
      mean <-
        mean(filteredResults$grade) # calculate mean of filtered grade column
    } else {
      stop("Required columns are missing in the dataframe!")
    }
    
    return (mean)
  }

GetGradesOfStudent <- function(resultFrame, matriculationNumber) {
  # Extracts all related grades of the specified matriculationNumber
  #
  # Args:
  #   x: Dataframe containing all grades for all students
  #   y: examID: Unique string identifier for the student wanted.
  #
  # Returns:
  #   A list containing the matriculationNumber as well as a vector with related grades
  
  if (is.data.frame(resultFrame) &&
      "grade" %in% colnames(resultFrame) &&
      "matriculation_number_id" %in% colnames(resultFrame)) {
    # filter resultframe by examID and get grade column
    allGrades <-
      subset(resultFrame,
             matriculation_number_id == matriculationNumber)$grade
    
    return (list(Student = matriculationNumber, Grades = allGrades))
  } else {
    stop("Required columns are missing in the dataframe!")
  }
}

CalculateMeanOfAllStudents <- function(resultFrame) {
  # Computes the mean for all students with results
  #
  # Args:
  #   resultframe: Dataframe containig all results for students
  #
  # Returns:
  #   Dataframe containing all students and their mean of grades
  
  if (is.data.frame(resultFrame) &&
      "grade" %in% colnames(resultFrame) &&
      "matriculation_number_id" %in% colnames(resultFrame)) {
    # instantiate empty dataframe with the two columns for student and grade
    studentmean <-
      data.frame(
        Student = character(),
        Mean = double(),
        stringsAsFactors = FALSE
      )
    
    uniqueStudents <-
      unique(resultFrame$matriculation_number_id)  # get list of unique students with results
    for (matriculationNumber in uniqueStudents) {
      meanOfStudent <-
        CalculateMeanOfStudent(resultFrame, matriculationNumber)  # get mean for each student
      if (!is.nan(meanOfStudent) && is.numeric(meanOfStudent)) {
        studentmean[nrow(studentmean) + 1,] = list(as.character(matriculationNumber), meanOfStudent)  # add new new row to dataframe
      }
    }
    
    return (studentmean)
  } else {
    stop("Required columns are missing in the dataframe!")
  }
}

CalculateMedianOfAllStudents <- function(resultFrame) {
  # Calculates the median of all students grade mean
  #
  # Args:
  #   resultframe: Dataframe containig all results for students
  #
  # Returns:
  #   Median Value of the students grades mean
  
  meanAllStudents <-
    CalculateMeanOfAllStudents(resultFrame)  # get dataframe with all students and their mean
  if (is.data.frame(meanAllStudents) &&
      "Mean" %in% colnames(meanAllStudents)) {
    median <- median(meanAllStudents[, "Mean"])  # get median value
    
    return (median)
  } else {
    stop("Required columns are missing in the dataframe!")
  }
}

CalculateStandardDeviationOfAllStudents <- function(resultFrame) {
  # Calculates the standard deviation of all students grade mean
  #
  # Args:
  #   resultframe: Dataframe containig all results for students
  #
  # Returns:
  #   Standard deviation of the students grades mean
  
  meanAllStudents <-
    CalculateMeanOfAllStudents(resultFrame)  # get dataframe with all students and their mean
  if (is.data.frame(meanAllStudents) &&
      "Mean" %in% colnames(meanAllStudents)) {
    sd <- sd(meanAllStudents[, "Mean"])
    
    return (sd)
  } else {
    stop("Required columns are missing in the dataframe!")
  }
}