createOfBoxplot <- function(dataFrame) {
  p <-
    ggplot(data = data.frame(Noteneinerprüfung), aes(x = "dataFrame", y = dataFrame)) +
    geom_boxplot()
  p
}