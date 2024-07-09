#Prediction of Breast Cancer Diagnosis through Machine Learning Techniques

This project employs machine learning techniques to classify breast cancer diagnoses as benign or malignant using the Breast Cancer Wisconsin Diagnostic Dataset (WDBC). The dataset includes digital measurements from breast lumps obtained via fine needle aspirants, capturing various tumor characteristics.

##Abstract
The study aims to develop machine learning models to aid in breast cancer diagnosis. Through extensive Exploratory Data Analysis (EDA), the dataset's structure, feature distributions, and correlations were analyzed. The models evaluated include K-Nearest Neighbor (KNN), Random Forest, Support Vector Machine (SVM), and others. Notably, KNN achieved 100% prediction accuracy. The Synthetic Minority Over-sampling Technique (SMOTE) was applied to balance the dataset, improving model performance. The study highlights KNN and Random Forest as top-performing models, though it questions the utility of AUC in evaluating certain models.

##Key Findings
Dataset: Breast Cancer Wisconsin Diagnostic Dataset (WDBC)
Features: 30 real-valued input features representing characteristics of cell nuclei
Class Distribution: 357 benign, 212 malignant instances
Top Models: KNN (100% accuracy), Random Forest, SVM, QDA
Balancing Technique: SMOTE improved accuracy across models
Evaluation Metrics: Accuracy, Precision, Recall, F1-score, AUC

##Methodology
1. Data Preprocessing: Standardized input features, handled missing values, and performed PCA for feature selection.
2. Model Training: Evaluated eight machine learning models using original and balanced datasets.
3. Model Evaluation: Used accuracy, sensitivity, specificity, F1-score, and AUC for performance assessment.

##Conclusion
The study underscores the importance of robust preprocessing and balancing techniques for accurate model performance. KNN and Random Forest were identified as top-performing models, although the practical applicability of AUC in evaluating certain models is questioned. Future research is suggested to explore alternative evaluation metrics and understand the discrepancy between accuracy and AUC in KNN models.

##References
UCI Machine Learning Repository

For more detailed information, please refer to the full project documentation and code.
