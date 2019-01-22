# This file contains all functions that are creating graphical visualizations of data
# Authors: Stefanie Scholtz

CreateBoxPlot <- function(gradeList) {
  # Creates a Box-Plot chart of all grades of an exam
  #
  # Args:
  #   gradeList: List containing the name and all grades of an exam
  #
  # Returns:
  #   The Box-Plot chart representing the exam data
  
  boxPlot <-
    ggplot(data = data.frame(gradeList),
           aes(x = "Verteilung", y = gradeList$Grades)) +
    geom_boxplot() +
    labs(title =sprintf("Notenverteilung der Prüfungsnummer %s", gradeList$Exam), x = "Darstellung", y = "Note")+
    scale_y_continuous(
      breaks = seq(1, 5, 0.1)
    )+
    geom_point(aes(x = "Explizit", y = gradeList$Grades),shape=23, fill="blue")
    
  return(boxPlot)
}

CreateJitterPlot <- function(studentMeanFrame) {
  # Creates a Jitter-Plot chart of all students mean
  #
  # Args:
  #   studentMeanFrame: Dataframe containing the mean of all students by matriculatio number
  #
  # Returns:
  #   The Jitter-Plot chart representing the students mean data
  
  jitterPlot <-
    ggplot(data = studentMeanFrame,
           aes(x = factor(studentMeanFrame$Student), y = studentMeanFrame$Mean)) +
    geom_point(shape=23, fill="blue")+
    geom_boxplot(
      aes(x = "Verteilung", y = studentMeanFrame$Mean),
      outlier.colour = "red",
      outlier.shape = 1
    ) +
    scale_y_continuous(breaks = seq(1, 5, 0.1)) + 
    labs(title ="Notenschnitte der Studenten", x = "Matrikelnummer", y = "Notenschnitt")
  
  return(jitterPlot)
}

CreateStudentsPerformanceOverview <- function(resultFrame) {
  # Creates a bar chart of all students and their grades as boxplots
  #
  # Args:
  #   studentMeanFrame: Dataframe containing the mean of all students by matriculatio number
  #
  # Returns:
  #   The bar chart representing the students grades as boxplots
  boxPlot <-
    ggplot(
      data = resultFrame,
      aes(
        x = factor(resultFrame$matriculation_number_id),
        y = resultFrame$grade
      )
    ) +
    geom_boxplot(
      outlier.colour = "red",
      outlier.shape = 1
    ) +
    labs(title ="Leistungsübersicht aller Studenten", x = "Matrikelnummer", y = "Note")+
    scale_y_continuous(
      breaks = seq(1, 5, 0.1)
    )+
    theme_gray()
  
  return(boxPlot)
}