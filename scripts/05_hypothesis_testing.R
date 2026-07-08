#H0: Mean G3 is the same for males and females
#H1: Mean G3 is different

t.test(G3 ~ sex, data = student)

# p< 0.05, H0 isd accepted

student$studytime <- as.factor(student$studytime)
anova_model <- aov(G3 ~ studytime, data = student)
summary(anova_model)

#p>0.05, no significant effect of time in grades

student$GradeCategory <- ifelse(student$G3 >= 10, "Pass", "Fail")
student$GradeCategory <- as.factor(student$GradeCategory)

chisq.test(table(student$internet, student$GradeCategory))

#p>0.05, internet access is not associated with passing or failing

#saving results

capture.output(
  t.test(G3 ~ sex, data = student),
  file = "output/t_test_result.txt"
)
capture.output(
  summary(anova_model),
  file = "output/anova_results.txt"
)