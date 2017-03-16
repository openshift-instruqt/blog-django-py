import os
import requests

hostname = os.environ['HOSTNAME']

response = requests.get('http://%s:8080/' % hostname)
response.raise_for_status()
