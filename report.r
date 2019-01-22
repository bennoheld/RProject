library(ggplot2)
library(dplyr)

# import business logic functions
source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")
source("R/visualization.R")

options(encoding = "UTF-8")

# load Data
allData <- LoadAllData()

# calculate key indicators
gradesSpecificExam <-
  GetGradesOfExam(allData$ResultFrame, examID = '1000')

meanSpecificExam <-
  CalculateMeanOfExam(allData$ResultFrame, examID = '1000')

gradesSpecificStudent <-
  GetGradesOfStudent(allData$ResultFrame, matriculationNumber = '75528')

meanSpecificStudent <-
  CalculateMeanOfStudent(allData$ResultFrame, matriculationNumber = '75528')

meanAllStudents <- CalculateMeanOfAllStudents(allData$ResultFrame)

medianAllStudents <-
  CalculateMedianOfAllStudents(allData$ResultFrame)

standardDeviationAllStudents <-
  CalculateStandardDeviationOfAllStudents(allData$ResultFrame)

# Charts
CreateBoxPlot(gradesSpecificExam)

CreateJitterPlot(meanAllStudents)

CreateStudentsPerformanceOverview(allData$ResultFrame)
