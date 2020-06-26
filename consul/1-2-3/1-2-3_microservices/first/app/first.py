from flask import Flask
import requests
import os

app = Flask(__name__)
 
@app.route('/')
def get_first():
  response = requests.get('http://second.service.consul:6001')
  res='{"Service":"First"}\n'
  res=res + response.content.decode('utf-8')
  return res

if __name__ == '__main__':
  app.run(debug=True,host='0.0.0.0',port=5000)