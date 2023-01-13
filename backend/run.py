from flask import Flask,request,jsonify
from flask_cors import CORS
import os,sqlite3,json,spider
from geopy.geocoders import Nominatim
app=Flask(__name__)
CORS(app)
@app.route('/',methods=['POST'])
def postdata():
    #經緯度換算地區
    geoLoc = Nominatim(user_agent="GetLoc")
    body=json.loads(request.data.decode('UTF-8'))
    lat=body['lat']
    log=body['log']
    locname = geoLoc.reverse((lat,log))
    print(locname)
    js=spider.spider(locname[0][-12:-9],locname[0][-17:-14])
    return js
if __name__=='__main__':
    app.run(host='0.0.0.0',port=3000,debug=True)    
    