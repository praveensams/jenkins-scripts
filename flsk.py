from flask import Flask
from subprocess import *
from urllib2 import *
app = Flask(__name__)


@app.route('/')
def hello():
    red=' '.join(open("/tmp/reader","r").readlines())
    return "{}".format(str(red))

@app.route('/incre')
def incre():
    s=Popen('bash -x ~/incre.sh',stdout=PIPE,shell=True).communicate()
    ret=str(open('/hybris/share/workspace/hybris-package-dev/temp/hybris/hybrisServer/version','r').readlines())
    return '{0}'.format(ret)

