#Studying bar plots from link - http://www.theanalysisfactor.com/r-11-bar-charts/
#create a simple table of counts of the elements in a data set
H <- c(2,3,3,3,4,5,5,5,5,6)

#count the elements using the table() command, as follows:
counts <- table(H)
counts
H

#plot the counts
barplot(counts)


#plot complex barplot
barplot(B, main="MY NEW BARPLOT", xlab="LETTERS", ylab="MY Y VALUES", names.arg=c("A","B","C","D","E","F","G"),
        border="red", density=c(90, 70, 50, 40, 30, 20, 10))


#Another complex bar chart
data <- structure(list(W= c(1L, 3L, 6L, 4L, 9L), X = c(2L, 5L, 
                                                       4L, 5L, 12L), Y = c(4L, 4L, 6L, 6L, 16L), Z = c(3L, 5L, 
                                                                                                       6L, 7L, 6L)), .Names = c("W", "X", "Y", "Z"), class = "data.frame", row.names = c(NA, -5L))
attach(data)
print(data)

#creating side-by-side bar plots using differnt colors
#First, set colors
colours <- c("red", "orange", "blue", "yellow", "green")
#plot a bar chart of the four variables, with adjacent bars, 
#using the as.matrix() command and the argument beside = T.
barplot(as.matrix(data), main="My Barchart", ylab = "Numbers", cex.lab = 1.5, cex.main = 1.4, beside=TRUE, col=colours)


#create a legend at the top-left corner. 
#To create a legend without a frame, include: bty=”n”. 
#The bty argument controls legend borders.
legend("topleft", c("First","Second","Third","Fourth","Fifth"), cex=1.3, bty="n", fill=colours)


#Another complex bar chart from timesheet

data <- structure(list(M= c(4.25L, 4.75L, 0L, 1.5L, 4.5L, 1.5L, 7.5L), 
                       T = c(2.75L, 6.25L,0.25L, 1.25L, 6.25L, 0.75L, 6.5L), 
                       W = c(1L, 4L, 0L, 4.5L, 6.5L, 0.25L, 6.75L), 
                       Th = c(4L, 4.5L, 0.25L, 1.5L, 5.25L, 0.5L, 8L), 
                       F = c(1.25L, 3.25L, 1.75L, 1.75L, 7.25L, 1L, 7.75L), 
                       S = c(0.25L, 7L, 0.5L, 1.25L, 2.25L, 1L, 11.75L), 
                       Su = c(1.75L, 4.5L, 0L, 2L, 4.5L, 2L, 9.25L)), 
                  .Names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"), class = "data.frame", row.names = c(NA, -7L))
attach(data)
print(data)

#creating side-by-side bar plots using differnt colors
#First, set colors
colours <- c("orange", "green", "blue", "yellow", "purple", "red", "black")
#plot a bar chart of the seven variables, with adjacent bars, 
#using the as.matrix() command and the argument beside = T.
barplot(as.matrix(data), main="Time Analysis", ylab = "Hours", cex.lab = 1.5, cex.main = 1.4, beside=TRUE, col=colours)


#create a legend at the top-left corner. 
#To create a legend without a frame, include: bty=”n”. 
#The bty argument controls legend borders.
legend("topleft", c("Work","Family","Friends","Cooking","Chores", "Leisure", "Sleep"), cex=1.3, bty="n", fill=colours)

