from flask import Flask
from subprocess import *
from urllib2 import *
app = Flask(__name__)



@app.route('/pre-stage')
def prestage():
    s=Popen('bash -x /scripts/prestage.sh',stdout=PIPE,shell=True).communicate()
    return '{0}'.format("triggered")


@app.route('/pre-prod')
def preprod():
    s=Popen('bash -x /scripts/preprod.sh',stdout=PIPE,shell=True).communicate()
    return '{0}'.format("triggered")

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=7070)

