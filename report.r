source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")

#connect to DB
con <- connecttodb()

#Do the reports!
# - Alle Noten eines bestimmten Studierenden
Noteneinesstudenten <- getGradesOfStudent(con, '45734')

# - Notenschnitt eines bestimmten Studierenden
#result <- getMeanOfStudent(con, '45734')

# - Alle Noten einer bestimmten Prüfung
#Noteneinerprüfung <- getGradesOfExam(con, '1000')

# - Notenschnitt einer bestimmten Prüfung
#Notenschnitt <- getMeanOfExam(con, '1000')

# - Notenschnitte aller Studierenden
print('function call')
Notenallerstudenten <- getMeanOfAllStudents(con)

# - Median der Notenschnitte

# - Standardabweichung der Notenschnitte

# - Zeichnen Sie geeignete Diagramme zur Visualisierung der Daten mit Hilfe von ggplot
#  - Noten einer bestimmten Prüfung
#  - Notenschnitte aller Studierenden

#disconnect from DB
if (dbDisconnect(conn = con)) {
  print('SUCCESFULLY DISCONNECTED FROM DB!')
} else {
  print('ERROR WHILE DISCONNECTING FROM DB!')
}