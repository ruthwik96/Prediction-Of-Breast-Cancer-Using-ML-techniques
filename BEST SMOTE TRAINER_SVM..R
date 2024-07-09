accuracy_smote<-c()
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 221, k = 5)
svm_model <- svm(Diagnosis ~ ., data = TrainData_OS, kernel = "radial")
predictions_svm <- predict(svm_model, newdata = TestData)
prediction_svm_cm<-table(predictions_svm,TestData$Diagnosis)
prediction_svm_er<-(prediction_svm_cm[1,2]+prediction_svm_cm[2,1])/sum(prediction_svm_cm)
accuracy_svm <- 1-prediction_svm_er
accuracy_smote[1]=accuracy_svm
TrainData_SMOTE=TrainData_OS
for (i in 2:100)
{
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 221, k = 5)
svm_model <- svm(Diagnosis ~ ., data = TrainData_OS, kernel = "radial")
predictions_svm <- predict(svm_model, newdata = TestData)
prediction_svm_cm<-table(predictions_svm,TestData$Diagnosis)
prediction_svm_er<-(prediction_svm_cm[1,2]+prediction_svm_cm[2,1])/sum(prediction_svm_cm)
accuracy_svm <- 1-prediction_svm_er
if(sum(accuracy_svm<accuracy_smote)==0) {TrainData_SMOTE=TrainData_OS}
accuracy_smote[i]=accuracy_svm
}

svm_model <- svm(Diagnosis ~ ., data = TrainData_SMOTE, kernel = "radial")
predictions_svm <- predict(svm_model, newdata = TestData)
prediction_svm_cm<-table(predictions_svm,TestData$Diagnosis)
prediction_svm_er<-(prediction_svm_cm[1,2]+prediction_svm_cm[2,1])/sum(prediction_svm_cm)
accuracy_svm <- 1-prediction_svm_er
accuracy_svm

write.csv(TrainData_SMOTE, file = "TrainData_SMOTE_svm.csv", row.names = FALSE)
