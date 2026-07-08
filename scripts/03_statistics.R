#descriptive statistics
library(psych)
describe(student)

#statistics for final grade
describe(student$G3)

#Correlation analysis

numeric_data <- student[,sapply(student, is.numeric)]
cor_matrix <- cor(numeric_data)
round(cor_matrix,2)

#correlation heatmap

library(corrplot)

corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.7)

sort(cor_matrix[,"G3"], decreasing = T)


#covariance matrix

cov(numeric_data)

#saving

write.csv(
  cor_matrix,
  "output/correlation_matrix.csv"
)
