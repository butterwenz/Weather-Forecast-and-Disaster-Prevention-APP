import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


def spider(inputcity,inputarea):
    # chromedriver = "C:\chromedriver.exe"
    # headless = webdriver.ChromeOptions()
    # headless.add_argument('headless') # 隱藏參數 - 不用開啟瀏覽器
    # web = webdriver.Chrome(executable_path=chromedriver, options=headless)
    # urlweanow = 'c:\\users\stanley\h7_4.html'
    # web.get('https://www.google.com/search?q=weather')
    # web.implicitly_wait(6) # 等待網頁載入
    # # 抓取溫度
    # temp_element = web.find_element(By.ID, "//span[@id='wob_tm']")
    # temp = temp_element.text

    # # 抓取降雨機率
    # rain_element = web.find_element(By.ID, "//span[@id='wob_pp']")
    # rain = rain_element.text

    # # 抓取濕度
    # humidity_element = web.find_element(By.ID, "//span[@id='wob_hm']")
    # humidity = humidity_element.text

    # # 抓取地區
    # location_element = web.find_element(By.CLASS_NAME, "//span[@id='wob_hm']")
    # location = location_element.text
    # val={"nowWeatherElement":{"temp":temp,"rain":rain,"humidity":humidity,"location":location}}
    # print(val)



    dataset3day={'宜蘭縣':'F-D0047-001',
'桃園市':'F-D0047-005',
'新竹縣':'F-D0047-009',
'苗栗縣':'F-D0047-013',
'彰化縣':'F-D0047-017',
'南投縣':'F-D0047-021',
'雲林縣':'F-D0047-025',
'嘉義縣':'F-D0047-029',
'屏東縣':'F-D0047-033',
'臺東縣':'F-D0047-037',
'花蓮縣':'F-D0047-041',
'澎湖縣':'F-D0047-045',
'基隆市':'F-D0047-049',
'新竹市':'F-D0047-053',
'嘉義市':'F-D0047-057',
'臺北市':'F-D0047-061',
'高雄市':'F-D0047-065',
'新北市':'F-D0047-069',
'臺中市':'F-D0047-073',
'臺南市':'F-D0047-077',
'連江縣':'F-D0047-081',
'金門縣':'F-D0047-085'}
    dataset7day={"宜蘭縣":"F-D0047-003",
"桃園市":"F-D0047-007",
"新竹縣":"F-D0047-011",
"苗栗縣":"F-D0047-015",
"彰化縣":"F-D0047-019",
"南投縣":"F-D0047-023",
"雲林縣":"F-D0047-027",
"嘉義縣":"F-D0047-031",
"屏東縣":"F-D0047-035",
"臺東縣":"F-D0047-039",
"花蓮縣":"F-D0047-043",
"澎湖縣":"F-D0047-047",
"基隆市":"F-D0047-051",
"新竹市":"F-D0047-055",
"嘉義市":"F-D0047-059",
"臺北市":"F-D0047-063",
"高雄市":"F-D0047-067",
"新北市":"F-D0047-071",
"臺中市":"F-D0047-075",
"臺南市":"F-D0047-079",
"連江縣":"F-D0047-083",
"金門縣":"F-D0047-087"}
    url=f'https://opendata.cwb.gov.tw/api/v1/rest/datastore/{dataset3day[inputcity]}?Authorization=CWB-9A2C29F6-F6A2-4C1F-A59A-349D51FA91EF'
    res3day=requests.get(url=url)
    res=res3day.json()
    for i in range(0,len(res["records"]["locations"][0]["location"])):
        if res["records"]["locations"][0]["location"][i]["locationName"]==inputarea:
            res=res["records"]["locations"][0]["location"][i]
            break
    repnow=requests.get('https://opendata.cwb.gov.tw/api/v1/rest/datastore/O-A0001-001?Authorization=CWB-9A2C29F6-F6A2-4C1F-A59A-349D51FA91EF')
    resnow=repnow.json()
    for i in resnow["records"]["location"]:
        if i["parameter"][0]["parameterValue"]==inputcity and i["parameter"][2]["parameterValue"]==inputarea:
            i["todayWeatherElement"]=i.pop("weatherElement")
            res.update(i)

            break
    url7day=f'https://opendata.cwb.gov.tw/api/v1/rest/datastore/{dataset7day[inputcity]}?Authorization=CWB-9A2C29F6-F6A2-4C1F-A59A-349D51FA91EF'            
    res7day=requests.get(url7day)
    r7=res7day.json()
    for r in r7["records"]["locations"][0]["location"]:
        if r["locationName"]==inputarea:
            r["sevenDayWeatherElement"]=r.pop("weatherElement")
            res.update(r)
            break
    return res