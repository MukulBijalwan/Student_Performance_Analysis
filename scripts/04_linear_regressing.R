
model <- lm(
  G3 ~ studytime + absences + G1 + G2 + failures + age,
  data = student
)

#view model
summary(model)

#confidence interval
confint(model)

#predicted value

student$Predicted_G3 <- predict(model)
head(student[,c("G3", "Predicted_G3")])

#plotting actual vs predicted

library(ggplot2)

ggplot(student, aes(x= G3, y = Predicted_G3))+
  geom_point(color = "blue")+
  geom_abline(intercept = 0, slope = 1, color = "red")+
  labs(
    title = "Actual VS Predicted Final Grades",
    x = "Actual Grades",
    y = "Predicted Grade"
  )+
  theme_minimal()

ggplot(student, aes(x = Predicted_G3, y = residuals(model)))+
  geom_point()+
  geom_hline(yintercept = 0, color = "red")+
  labs(
    title = "Residual Plot",
    x = "Predicted Grades",
    y = "Residuals"
  )+
  theme_minimal()

write.csv(student,
          "output/student_predictions.csv",
          row.names = F)