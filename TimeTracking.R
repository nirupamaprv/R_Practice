#Creating bar chart from timesheet

#Add time sheet values to dataframe
data <- structure(list(M= c(4.25L, 4.75L, 0L, 1.5L, 4.5L, 1.5L, 7.5L), 
                       T = c(2.75L, 6.25L,0.25L, 1.25L, 6.25L, 0.75L, 6.5L), 
                       W = c(1L, 4L, 0L, 4.5L, 6.5L, 0.25L, 6.75L), 
                       Th = c(4L, 4.5L, 0.25L, 1.5L, 5.25L, 0.5L, 8L), 
                       F = c(1.25L, 3.25L, 1.75L, 1.75L, 7.25L, 1L, 7.75L), 
                       S = c(0.25L, 7L, 0.5L, 1.25L, 2.25L, 1L, 11.75L), 
                       Su = c(1.75L, 4.5L, 0L, 2L, 4.5L, 2L, 9.25L)), 
                  .Names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), class = "data.frame", row.names = c(NA, -7L))
attach(data)
#print(data)

#creating side-by-side bar plots using differnt colors
#First, set colors
colours <- c("yellow", "orange", "red", "pink", "purple", "blue", "black")
#plot a bar chart of the seven variables, with adjacent bars, 
#using the as.matrix() command and the argument beside = T.
barplot(as.matrix(data), main="Time Analysis", ylab = "Hours", cex.lab = 1.5, cex.main = 1.4, beside=TRUE, col=colours)


#create a legend at the top-left corner. 
#To create a legend without a frame, include: bty=”n”. 
#The bty argument controls legend borders.
legend("topleft", c("Work","Family","Friends","Cooking","Chores", "Leisure", "Sleep"), cex=1.3, bty="n", fill=colours)

