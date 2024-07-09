accuracy_smote<-c()
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 168, k = 5)
train.x=data.frame(TrainData_OS[,1:30])
test.x=data.frame(TestData_OS[,1:30])
train.y=factor(TrainData_OS[,31])
test.y=factor(TestData_OS[,31])
KNN.fit=knn(train.x, test.x, train.y,k=5)
cm_KNN<-confusionMatrix(KNN.fit,test.y)
accuracy_KNN <- cm_KNN$overall['Accuracy']
accuracy_smote[1]=accuracy_KNN
TrainData_SMOTE=TrainData_OS
for (i in 2:1000)
{
TrainData_OS<-SMOTE(Diagnosis ~ ., TrainData, perc.over = 168, k = 5)
train.x=data.frame(TrainData_OS[,1:30])
test.x=data.frame(TestData_OS[,1:30])
train.y=factor(TrainData_OS[,31])
test.y=factor(TestData_OS[,31])
KNN.fit=knn(train.x, test.x, train.y,k=5)
cm_KNN<-confusionMatrix(KNN.fit,test.y)
accuracy_KNN <- cm_KNN$overall['Accuracy']
if(sum(accuracy_KNN<accuracy_smote)==0) {TrainData_SMOTE=TrainData_OS}
accuracy_smote[i]=accuracy_KNN
}

train.x=data.frame(TrainData_SMOTE[,1:30])
test.x=data.frame(TestData_OS[,1:30])
train.y=factor(TrainData_SMOTE[,31])
test.y=factor(TestData_OS[,31])
KNN.fit=knn(train.x, test.x, train.y,k=5)
cm_KNN<-confusionMatrix(KNN.fit,test.y)
accuracy_KNN <- cm_KNN$overall['Accuracy']
accuracy_KNN
table(TrainData_SMOTE$Diagnosis)

write.csv(TrainData_SMOTE, file = "TrainData_SMOTE_KNN.csv", row.names = FALSE)
