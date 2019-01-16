createBoxPlot <- function(dataFrame) {
  print(dataFrame)
  p <-
    ggplot(data = dataFrame, aes(x = "Prüfungsnummer", y = dataFrame[,1])) +
    geom_boxplot()
  p
}