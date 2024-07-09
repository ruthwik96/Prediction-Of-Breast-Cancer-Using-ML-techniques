library(DMwR)
library(randomForest)
TestData_OS<-TestData
accuracy_smote<-c()
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 215, k = 5)
model_rf <- randomForest(Diagnosis ~ ., data = TrainData_OS, ntree = 100)
predictions <- predict(model_rf, newdata = TestData_OS)
prediction_rf<-table(predictions,TestData_OS$Diagnosis)
prediction_rf_er<-(prediction_rf[1,2]+prediction_rf[2,1])/sum(prediction_rf)
accuracy_rf <- 1-prediction_rf_er
accuracy_smote[1]=accuracy_rf
TrainData_SMOTE_rf=TrainData_OS
for (i in 2:1000)
{
  TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 215, k = 5)
  model_rf <- randomForest(Diagnosis ~ ., data = TrainData_OS, ntree = 100)
  predictions <- predict(model_rf, newdata = TestData_OS)
  prediction_rf<-table(predictions,TestData_OS$Diagnosis)
  prediction_rf_er<-(prediction_rf[1,2]+prediction_rf[2,1])/sum(prediction_rf)
  accuracy_rf <- 1-prediction_rf_er
  if(sum(accuracy_rf <accuracy_smote)==0) {TrainData_SMOTE_rf=TrainData_OS}
  accuracy_smote[i]= accuracy_rf
}

set.seed(12)
model_rf <- randomForest(Diagnosis ~ ., data = TrainData_SMOTE_rf, ntree = 100)
predictions <- predict(model_rf, newdata = TestData_OS)
prediction_rf<-table(predictions,TestData_OS$Diagnosis)
prediction_rf_er<-(prediction_rf[1,2]+prediction_rf[2,1])/sum(prediction_rf)
accuracy_rf <- 1-prediction_rf_er
accuracy_rf

#write.csv(TrainData_SMOTE_rf, file = "TrainData_SMOTE_rf.csv", row.names = FALSE)
