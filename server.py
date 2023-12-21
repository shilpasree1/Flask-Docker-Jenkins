from flask import Flask, request, jsonify
import json
import pickle
import pandas as pd
import numpy as np

app = Flask(__name__)

# Load the model
model = pickle.load(open('model.pkl','rb'))
labels ={
  0: "versicolor",
  1: "setosa",
  2: "virginica"
}

print(labels)
@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    print(data)
    predict = model.predict(data['feature'])
    return jsonify(predict[0].tolist())

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port='8000')
