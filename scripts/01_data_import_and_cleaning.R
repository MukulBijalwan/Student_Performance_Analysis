
#installing packages
install.packages(c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "readr",
  "corrplot",
  "psych",
  "car"
))

#load packages
library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)
library(corrplot)
library(psych)
library(car)

#loading dataset
student <- read.csv2("data/student_performance.csv")
#view first row
head(student)
#dataset structure
str(student)
#summary statistics
summary(student)
#dimensions
dim(student)

#inspecting missing values
colSums(is.na(student))
#check for duplicate records
sum(duplicated(student))
#Conversion of variables to appropriate types

student$sex <- as.factor(student$sex)
student$internet <- as.factor(student$internet)
student$activities <- as.factor(student$activities)

#saving
write.csv(
  student,
  "output/student_clean.csv",
  row.names = F
)

