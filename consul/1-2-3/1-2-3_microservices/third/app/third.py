from flask import Flask
import requests
import os

app = Flask(__name__)
 
@app.route('/')
def get_tax():
  res='{"Service":"Third"}\n'
  return res

if __name__ == '__main__':
  app.run(debug=True,host='0.0.0.0',port=5002)