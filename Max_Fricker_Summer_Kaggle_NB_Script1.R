library(e1071)
setwd("~/University/Open University Summer 2022")
space <- read.csv('myspacedata.csv')

train <- space[1:8693, ]
test <- space[8694:12970, ]
NB_model <- naiveBayes(Transported ~ ., data = train)
pred <- predict(NB_model, test, type = "raw")

for (r in seq(1:4277)){
  if (pred[r, 2] < 0.8) test[r, 'Transported'] = "False"
  else test[r, 'Transported'] = "True"
}

sub <- cbind(test$PassengerId, test$Transported)

write.csv(sub,"C:\\Users\\maxfr\\OneDrive\\Documents\\University\\Open University Summer 2022\\sub24.csv", row.names = FALSE, quote = FALSE)
