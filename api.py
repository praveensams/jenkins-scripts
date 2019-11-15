import requests
from subprocess import *

d={}
url = "https://www.extra.com/extracommercewebservices/oauth/token"

querystring = {"client_secret":"cgtaft4rohwwjymky39ubdkywo1ryc10y003kv0e2ngrrshw1wg3gqr2kiz80ryo","grant_type":"client_credentials","client_id":"android","deviceId":"123456"}

payload = ""
headers = {
    'Content-Type': "appli",
    'User-Agent': "PostmanRuntime/7.19.0",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "7107375e-25c0-4903-a3db-ad35ef86dd5f,f17fa708-83ee-41a5-a529-2ccc8c267a38",
    'Host': "www.extra.com",
    'Accept-Encoding': "gzip, deflate",
    'Content-Length': "0",
    'Referer': "https://www.extra.com/extracommercewebservices/oauth/token?client_secret=cgtaft4rohwwjymky39ubdkywo1ryc10y003kv0e2ngrrshw1wg3gqr2kiz80ryo&grant_type=client_credentials&client_id=android&deviceId=123456",
    'Cookie': "JSESSIONID=EDF0512B188F4A39670B9D84481818AC.app23",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
    }

response = requests.request("POST", url, data=payload, headers=headers, params=querystring)

d=response.text.split(",")[0].split(":")[1].replace("\"","")

url = "https://www.extra.com/extracommercewebservices/v2/extra_sa/getHomePageContent/"

querystring = {"fields":"FULL","lang":"en","deviceId":"123456"}

headers = {
    'Appsessiontoken': "112233",
    'appId': "AndroidApp",
    'Authorization': "bearer  {0}".format(d),
    'User-Agent': "PostmanRuntime/7.19.0",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "fe0872a2-9fc4-4a88-a91b-9dda52f372d1,0346e10e-3f5c-4d0b-85c5-4dc00dacdd24",
    'Host': "www.extra.com",
    'Accept-Encoding': "gzip, deflate",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
    }

response = requests.request("GET", url, headers=headers, params=querystring)

t=response.text
if 'contentList' in t and 'sessionCity' in t:
    print("it is working")
else:
    tr=Popen('sh api.sh '.format(not_in,ko_all),stdout=PIPE,shell=True).communicate()[0]


