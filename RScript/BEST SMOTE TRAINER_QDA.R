accuracy_smote<-c()
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 415, k = 5)
qda_model <- qda(Diagnosis ~ ., data = TrainData_OS)
predictions_qda <- predict(qda_model, newdata = TestData)
prediction_qda_cm<-table(predictions_qda$class,TestData$Diagnosis)
prediction_qda_er<-(prediction_qda_cm[1,2]+prediction_qda_cm[2,1])/sum(prediction_qda_cm)
accuracy_qda <- 1-prediction_qda_er
accuracy_smote[1]=accuracy_qda
TrainData_SMOTE=TrainData_OS
for (i in 2:100)
{
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 415, k = 5)
qda_model <- qda(Diagnosis ~ ., data = TrainData_OS)
predictions_qda <- predict(qda_model, newdata = TestData)
prediction_qda_cm<-table(predictions_qda$class,TestData$Diagnosis)
prediction_qda_er<-(prediction_qda_cm[1,2]+prediction_qda_cm[2,1])/sum(prediction_qda_cm)
accuracy_qda <- 1-prediction_qda_er
if(sum(accuracy_qda<accuracy_smote)==0) {TrainData_SMOTE=TrainData_OS}
accuracy_smote[i]=accuracy_qda
}

qda_model <- qda(Diagnosis ~ ., data = TrainData_SMOTE)
predictions_qda <- predict(qda_model, newdata = TestData)
prediction_qda_cm<-table(predictions_qda$class,TestData$Diagnosis)
prediction_qda_er<-(prediction_qda_cm[1,2]+prediction_qda_cm[2,1])/sum(prediction_qda_cm)
accuracy_qda <- 1-prediction_qda_er
accuracy_qda

TrainData_SMOTE=TrainData_OS
write.csv(TrainData_SMOTE, file = "TrainData_SMOTE_qda.csv", row.names = FALSE)
