library(ggplot2)
library(dplyr)

source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")
source("R/visualization.R")


#connect to DB
con <- connecttodb()

#Do the reports!
# - Alle Noten eines bestimmten Studierenden
Noteneinesstudenten <- getGradesOfStudent(con, '45734')

# - Notenschnitt eines bestimmten Studierenden
#result <- getMeanOfStudent(con, '45734')

# - Alle Noten einer bestimmten Prüfung
<<<<<<< HEAD
#Noteneinerprüfung <- getGradesOfExam(con, '1000')
=======
Noteneinerpruefung <- getGradesOfExam(con, '1000')
>>>>>>> 1bb76617a2bf492a79d115274518b088fca70d96

# - Notenschnitt einer bestimmten Prüfung
#Notenschnitt <- getMeanOfExam(con, '1001')

# - Notenschnitte aller Studierenden
Notenallergeprüftenstudenten <- getMeanOfAllStudents(con)
Notenallerstudenten <- getMeanOfAllStudents(con, removeZeroes = FALSE)

# - Median der Notenschnitte
#Medianderschnitte <- getMedianOfGrades(con)

# - Standardabweichung der Notenschnitte
#Standardabweichungderschnitte <- getSdOfGrades(con)

# - Zeichnen Sie geeignete Diagramme zur Visualisierung der Daten mit Hilfe von ggplot
#  - Noten einer bestimmten Prüfung
#createOfBoxplot(Noteneinerprüfung)
#boxplot(Noteneinesstudenten)
#createOfBoxplot(Notenallergeprüftenstudenten$Mean)
#  - Notenschnitte aller Studierenden
#createOfJitter(Notenallerstudenten)
#createOfBar(Notenallerstudenten)
createReport(Notenallerstudenten)
#disconnect from DB
if (dbDisconnect(conn = con)) {
  print('SUCCESFULLY DISCONNECTED FROM DB!')
} else {
  print('ERROR WHILE DISCONNECTING FROM DB!')
}