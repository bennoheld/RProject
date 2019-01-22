library(ggplot2)
library(dplyr)

source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")
source("R/visualization.R")

options(encoding = "UTF-8")

allData <- LoadAllData()

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

CreateBoxPlot(gradesSpecificExam)

CreateJitterPlot(meanAllStudents)

CreateBarChart(meanAllStudents)

CreateReport(meanAllStudents)

boxPlot <-
  ggplot(
    data = allData$ResultFrame,
    aes(
      x = allData$ResultFrame$matriculation_number_id,
      y = allData$ResultFrame$grade
    )
  ) +
  geom_boxplot(aes(group = (
    factor(allData$ResultFrame$matriculation_number_id)
  ))) +
  xlab(allData$ResultFrame$matriculation_number_id) +
  ylab('Notenschnitt')

boxPlot
