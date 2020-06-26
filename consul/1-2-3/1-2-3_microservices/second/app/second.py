from flask import Flask, request, Response
import requests
import os
 
app = Flask(__name__)
 
@app.route('/')
def get_second():
  response = requests.get('http://third.service.consul:6002')
  res='{"Service":"Second"}\n'
  res=res + response.content.decode('utf-8')
  return res

if __name__ == '__main__':
  app.run(debug=True,host='0.0.0.0',port=5001)