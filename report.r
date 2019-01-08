source("R/dbconnect.R")
source("R/student.R")
source("R/exam.R")

#connect to DB
con <- connecttodb()

#Do the reports!
# - Alle Noten eines bestimmten Studierenden

# - Notenschnitt eines bestimmten Studierenden
result <- getMeanOfStudent(con, '755528')

# - Alle Noten einer bestimmten Prüfung

# - Notenschnitt einer bestimmten Prüfung

# - Notenschnitte aller Studierenden

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