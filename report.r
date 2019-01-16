library(ggplot2)
library(dplyr)

source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")
source("R/visualization.R")

options(encoding = "UTF-8")

allData <- getAllData()


gradesSpecificStudent <-
  getGradesOfStudent(allData$ResultFrame, matriculationNumber = '75528')
gradesSpecificStudent$Student

meanSpecificStudent <-
  getMeanOfStudent(allData$ResultFrame, matriculationNumber = '75528')

gradesSpecificExam <-
  getGradesOfExam(allData$ResultFrame, examID = '1000')
gradesSpecificExam$Exam

meanSpecificExam <-
  getMeanOfExam(allData$ResultFrame, examID = '1000')

meanAllStudents <- getMeanOfAllStudents(allData)

# gradesAllStudents <- getGradesOfAllStudents(allData)

medianAllStudents <- getMedianOfAllStudents(allData)

standardDeviationAllStudents <- getSdOfAllStudents(allData)