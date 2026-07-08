library(ggplot2)
library(dplyr)

summary(student)
mean(student$G3)
median(student$G3)
mode(student$G3)

#distribution of grades

ggplot(student, aes(x = G3))+
         geom_histogram(binwidth = 1, fill = "steelblue", colour = "black")+
         labs(
           title = "Distribution of Final Grades",
           x= "Final Grades",
           y = "Frequency")
         +
         theme_minimal()

ggplot(student, aes(x = sex, y = G3, fill = sex))+
  geom_boxplot()+
  labs(
    title = "Final Grades by Gender",
    x= "Gender",
    y = "Final Grade")
    +
    theme_minimal()

ggplot(student, aes(x = studytime, y = G3))+
  geom_jitter(width = 0.2, height = 0)+
  geom_smooth(method = "lm", colour = "red")
  labs(
    title = "Study Time VS Final Grades",
    x= "Study Time",
    y = "Final Grades")
    +
    theme_minimal()
  
ggplot(student, aes(x = absences, y = G3))+
  geom_point(color = "blue")+
  geom_smooth(method = "lm", colour = "red")
  labs(
    title = "Absences VS Final Grades",
    x= "Absences",
    y = "Final Grades")
  +
    theme_minimal()

ggplot(student, aes(x = school, y = G3, fill = school))+
  stat_summary(fun = mean, geom = "bar")
  labs(
    title = "Average Final Grade by School",
    x= "Scool",
    y = "Average Grades")
  +
    theme_minimal()