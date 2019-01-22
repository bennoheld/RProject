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
           aes(x = "Prüfungsnummer", y = gradeList$Grades)) +
    geom_boxplot() +
    xlab(gradeList$Exam) +
    ylab('Notenschnitt') +
    stat_boxplot(geom = 'errorbar', width = 0.5) +
    scale_y_continuous(
      limits = c(1, 5),
      breaks = seq(1, 5, 0.1),
      expand = c(0, 0)
    )
  
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
           aes(x = studentMeanFrame$Student, y = studentMeanFrame$Mean)) +
    geom_jitter(position = position_jitter(0), cex = 2) +
    xlab('Matrikelnummer') +
    ylab('Notenschnitt') +
    scale_y_continuous(limits = c(1, 5.1), breaks = seq(1, 5, 0.1))
  
  return(jitterPlot)
}

CreateBarChart <- function(studentMeanFrame) {
  # Creates a bar chart of all students mean
  #
  # Args:
  #   studentMeanFrame: Dataframe containing the mean of all students by matriculatio number
  #
  # Returns:
  #   The bar chart representing the students mean data
  
  barChart <-
    ggplot(data = studentMeanFrame,
           aes(x = studentMeanFrame$Student, y = studentMeanFrame$Mean)) +
    geom_bar(stat = "identity") +
    xlab('Matrikelnummer') +
    ylab('Notenschnitt') +
    scale_y_continuous(limits = c(0, 5), breaks = seq(0, 5, by = 0.1))
  
  return(barChart)
}

CreateReport <- function(studentMeanFrame) {
  BarPlot <- CreateBarChart(studentMeanFrame)
  JitterPlot <- CreateJitterPlot(studentMeanFrame)
  multiPlot(plotlist = list(BarPlot, JitterPlot), cols = 1)
}

multiPlot <-
  function(...,
           plotlist = NULL,
           file,
           cols = 1,
           layout = NULL) {
    # Multiple plot function
    #
    # ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
    # - cols:   Number of columns in layout
    # - layout: A matrix specifying the layout. If present, 'cols' is ignored.
    #
    # If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
    # then plot 1 will go in the upper left, 2 will go in the upper right, and
    # 3 will go all the way across the bottom.
    #
    
    library(grid)
    
    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)
    
    numPlots = length(plots)
    
    # If layout is NULL, then use 'cols' to determine layout
    if (is.null(layout)) {
      # Make the panel
      # ncol: Number of columns of plots
      # nrow: Number of rows needed, calculated from # of cols
      layout <- matrix(seq(1, cols * ceiling(numPlots / cols)),
                       ncol = cols,
                       nrow = ceiling(numPlots / cols))
    }
    
    if (numPlots == 1) {
      print(plots[[1]])
      
    } else {
      # Set up the page
      grid.newpage()
      pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
      
      # Make each plot, in the correct location
      for (i in 1:numPlots) {
        # Get the i,j matrix positions of the regions that contain this subplot
        matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
        
        print(plots[[i]],
              vp = viewport(
                layout.pos.row = matchidx$row,
                layout.pos.col = matchidx$col
              ))
      }
    }
  }