import pickle
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

# تحميل الموديل
with open('extra_tree_model.pkl', 'rb') as file:
    model = pickle.load("extra_tree_model.pkl")

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    features = np.array(data['features']).reshape(1, -1)
    prediction = model.predict(features)
    return jsonify({'prediction': int(prediction[0])})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
