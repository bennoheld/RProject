library(ggplot2)
library(dplyr)

source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")
source("R/visualization.R")

options(encoding = "UTF-8")

allData <- getAllData()


gradesSpecificStudent <- getGradesOfStudent(allData[[3]], matriculationNumber = '75528')

meanSpecificStudent <- getMeanOfStudent(allData[[3]], matriculationNumber = '75528')

gradesSpecificExam <- getGradesOfExam(allData[[3]], examID = '1000')

meanSpecificExam <- getMeanOfExam(allData[[3]], examID = '1000')

meanAllStudents <- getMeanOfAllStudents(allData)

medianAllStudents <- getMedianOfAllStudents(allData)

standardDeviationAllStudents <- getSdOfAllStudents(allData)