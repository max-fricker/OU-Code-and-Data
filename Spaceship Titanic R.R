library(e1071)
setwd("~/University/Open University Summer 2022")
train <- read.csv('train.csv')
test <- read.csv('test.csv')

test$Transported <- rep("True", 4277)

train_save <- train
test_save <- test

X <- rbind(train_save, test_save)
train <- X[1:8693, ]
test <- X[8694:12970, ]
# Build the model again and apply it to the test case.
NB_model <- naiveBayes(Transported ~ ., data = train)
pred <- predict(NB_model, test, type = "raw")
pred

for (r in seq(1:4277)){
  if (pred[r, 2] < 0.995) test[r, 'Transported'] = "False"
}

sub <- cbind(test$PassengerId, test$Transported)

write.csv(sub,"C:\\Users\\maxfr\\OneDrive\\Documents\\University\\Open University Summer 2022\\sub15.csv", row.names = FALSE, quote = FALSE)




library(e1071)
setwd("~/University/Open University Summer 2022")
space <- read.csv('myspacedata2.csv')

train <- space[1:8693, ]
test <- space[8694:12970, ]
NB_model <- naiveBayes(Transported ~ ., data = train)
pred <- predict(NB_model, test, type = "raw")

for (r in seq(1:4277)){
  if (pred[r, 2] < 0.9) test[r, 'Transported'] = "False"
  else test[r, 'Transported'] = "True"
}

sub <- cbind(test$PassengerId, test$Transported)

write.csv(sub,"C:\\Users\\maxfr\\OneDrive\\Documents\\University\\Open University Summer 2022\\sub41.csv", row.names = FALSE, quote = FALSE)



library(randomForest)
setwd("~/University/Open University Summer 2022")
space <- read.csv('myspacedata2.csv')

train <- space[1:8693, ]
test <- space[8694:12970, ]

rf_classifier <- randomForest(Transported ~ ., data = train, ntree = 500, importance = TRUE, na.action = na.pass)
pred <- predict(rf_classifier, test, type = "raw")

pred

for (r in seq(1:4277)){
  if (pred[r, 2] < 0.9) test[r, 'Transported'] = "False"
  else test[r, 'Transported'] = "True"
}

sub <- cbind(test$PassengerId, test$Transported)

write.csv(sub,"C:\\Users\\maxfr\\OneDrive\\Documents\\University\\Open University Summer 2022\\sub41.csv", row.names = FALSE, quote = FALSE)
