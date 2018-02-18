#get the working directory
getwd()

#set working directory
setwd("/Users/nirupamaprv/Documents/nimmu/Nanodegree/R Course/eda-course-materials/lesson2/")

#get the working directory
getwd()

#load data from csv into dataframe
statesInfo<- read.csv("stateData.csv")

#view contenst of dataframe
View(statesInfo)

#subset dataframe: get rows matching certain condition, use subset function
subset(statesInfo, state.region==1)

#subset dataframe: get rows matching certain condition, use subset function
subset(statesInfo, state.region==2)

#subset dataframe: get rows matching certain condition, use subset function
state_subset<-subset(statesInfo,state.region==4)

#get dimensions of new dataframe
dim(state_subset)

#inspect first few ros of dataframe- default 6 rows
head(state_subset)

#subset using bracket method
state_subset2<-statesInfo[statesInfo$state.region==4,]

#inspect first few ros of dataframe- default 6 rows
head(state_subset2)

#get dimensions of new dataframe
dim(state_subset2)
