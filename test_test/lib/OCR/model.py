import pickle
import pandas as pd
from IPython.core.display_functions import display

from sklearn.ensemble import ExtraTreesClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

from sklearn.metrics import accuracy_score, classification_report
from sklearn.preprocessing import LabelEncoder,MinMaxScaler
# import numpy as np
# import seaborn as sns

# تحميل البيانات
Gas_Sensors = pd.read_csv('Gas_Sensors_Measurements.csv')
Gas_Sensors.drop(['Corresponding Image Name','Serial Number'], axis=1, inplace=True)
label_encoder= LabelEncoder()
label=Gas_Sensors["Gas"]=label_encoder.fit_transform(Gas_Sensors["Gas"])
print(Gas_Sensors.to_string())
encoder = LabelEncoder()
encoded_data = encoder.fit_transform(label)
display (label)
label=Gas_Sensors.iloc[:,:9]
display(label)
x = label.iloc[:,:7]
y = label.iloc[:,7:8]

# تقسيم البيانات
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

# تدريب موديل Extra Tree
extra = ExtraTreesClassifier(n_estimators=100, random_state=0)
# extra = ExtraTreesClassifier(n_estimators=100, random_state=42, max_features="auto")
extra.fit(x_train, y_train)

# تقييم الموديل
pred = extra.predict(x_test)
extra.score(x_train,y_train)
extra.score(x_test,y_test)
accuracy_score = accuracy_score(y_test, pred) * 100
print("Accuracy Score for ExtraTrees is ", accuracy_score, "%")

# حفظ الموديل باستخدام pickle
with open('extra_tree_model.pkl', 'wb') as file:
    pickle.dump(extra, file)