import 'package:flutter/material.dart';
import 'Weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

String time =DateFormat("yMMMMd").format(DateTime.now());


class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}
class area{
  String? city;
  List<String>? arealist;
  area({
    required this.city,
    required this.arealist});
  getCity(){
    return city;
  }
  getArea(){
    return arealist;
  }

}
class _CurrentWeatherPageState  extends State<CurrentWeatherPage> {
  // List<area> list=[area(city: "宜蘭縣", arealist: ['頭城鎮','礁溪鄉','壯圍鄉','員山鄉','宜蘭市','大同鄉','五結鄉','三星鄉', '羅東鎮','冬山鄉','南澳鄉','蘇澳鎮']),
  //   area(city: "苗栗縣", arealist: ['竹南鎮','頭份市','三灣鄉','造橋鄉','後龍鎮','南庄鄉','頭屋鄉','獅潭鄉','苗栗市','西湖鄉','通霄鎮','公館鄉','銅鑼鄉','泰安鄉','苑裡鎮','大湖鄉','三義鄉','卓蘭鎮']),
  //   area(city: "'桃園市'", arealist: ['大園區','蘆竹區','觀音區','龜山區','桃園區','中壢區','新屋區','八德區', '平鎮區','楊梅區','大溪區','龍潭區','復興區']),
  //   area(city: '新竹縣', arealist: ['新豐鄉','湖口鄉','新埔鎮','竹北市','關西鎮','芎林鄉','竹東鎮','寶山鄉', '尖石鄉','橫山鄉','北埔鄉','峨眉鄉','五峰鄉']),
  //   area(city: "彰化縣",arealist: ['伸港鄉','和美鎮','線西鄉','鹿港鎮','彰化市','秀水鄉','福興鄉','花壇鄉', '芬園鄉','芳苑鄉','埔鹽鄉','大村鄉','二林鎮','員林市','溪湖鎮','埔心鄉', '永靖鄉','社頭鄉','埤頭鄉','田尾鄉','大城鄉','田中鎮','北斗鎮','竹塘鄉', '溪州鄉','二水鄉']),
  //   area(city:"南投縣",arealist: ['仁愛鄉','國姓鄉','埔里鎮','草屯鎮','中寮鄉','南投市','魚池鄉','水里鄉','名間鄉','信義鄉','集集鎮','竹山鎮','鹿谷鄉']),
  //   area(city: "雲林縣", arealist: ['麥寮鄉','二崙鄉','崙背鄉','西螺鎮','莿桐鄉','林內鄉','臺西鄉','土庫鎮','虎尾鎮','褒忠鄉','東勢鄉','斗南鎮','四湖鄉','古坑鄉','元長鄉','大埤鄉','口湖鄉','北港鎮','水林鄉','斗六市']),
  //   area(city: "嘉義縣", arealist: ['大林鎮','溪口鄉','阿里山鄉','梅山鄉','新港鄉','民雄鄉','六腳鄉','竹崎鄉','東石鄉','太保市','番路鄉','朴子市','水上鄉','中埔鄉','布袋鎮','鹿草鄉','義竹鄉','大埔鄉']),
  //   area(city: '屏東縣', arealist: ['高樹鄉','三地門鄉','霧臺鄉','里港鄉','鹽埔鄉','九如鄉','長治鄉','瑪家鄉','屏東市','內埔鄉','麟洛鄉','泰武鄉','萬巒鄉','竹田鄉','萬丹鄉','來義鄉','潮州鎮','新園鄉','崁頂鄉','新埤鄉','南州鄉','東港鎮','林邊鄉','佳冬鄉','春日鄉','獅子鄉','琉球鄉','枋山鄉','牡丹鄉','滿州鄉','車城鄉','恆春鎮','枋寮鄉']),
  //   area(city: "臺東縣", arealist: ['長濱鄉','海端鄉','池上鄉','成功鎮','關山鎮','東河鄉','鹿野鄉','延平鄉','卑南鄉','臺東市','太麻里鄉','綠島鄉','達仁鄉','大武鄉','蘭嶼鄉','金峰鄉花蓮縣 秀林鄉','新城鄉','花蓮市','吉安鄉','壽豐鄉','萬榮鄉','鳳林鎮','豐濱鄉','光復鄉','卓溪鄉','瑞穗鄉','玉里鎮','富里鄉']),
  //   area(city: "澎湖縣", arealist: ['白沙鄉','西嶼鄉','湖西鄉','馬公市','望安鄉','七美鄉']),
  //   area(city: "基隆市", arealist: [' 安樂區','中山區','中正區','七堵區','信義區','仁愛區','暖暖區']),
  //   area(city: "新竹市", arealist: ['北區','香山區','東區']),
  //   area(city: "嘉義市", arealist: ['東區,西區']),
  //   area(city: "臺北市", arealist: ['北投區','士林區','內湖區','中山區','大同區','松山區','南港區','中正區','萬華區','信義區','大安區','文山區']),
  //   area(city: "高雄市", arealist: ['楠梓區','左營區','三民區','鼓山區','苓雅區','新興區','前金區','鹽埕區','前鎮區','旗津區','小港區','那瑪夏區','甲仙區','六龜區','杉林區','內門區','茂林區','美濃區','旗山區','田寮區','湖內區','茄萣區','阿蓮區','路竹區','永安區','岡山區','燕巢區','彌陀區','橋頭區','大樹區','梓官區','大社區','仁武區','鳥松區','大寮區','鳳山區','林園區','桃源區']),
  //   area(city: "新北市", arealist: ['石門區','三芝區','金山區','淡水區','萬里區','八里區','汐止區','林口區','五股區','瑞芳區','蘆洲區','雙溪區','三重區','貢寮區','平溪區','泰山區','新莊區','石碇區','板橋區','深坑區','永和區','樹林區','中和區','土城區','新店區','坪林區','鶯歌區','三峽區','烏來區']),
  //   area(city: "臺中市", arealist: ['北屯區','西屯區','北區','南屯區','西區','東區','中區','南區','和平區','大甲區','大安區','外埔區','后里區','清水區','東勢區','神岡區','龍井區','石岡區','豐原區','梧棲區','新社區','沙鹿區','大雅區','潭子區','大肚區','太平區','烏日區','大里區','霧峰區']),
  //   area(city: '臺南市', arealist: ['安南區','中西區','安平區','東區','南區','北區','白河區','後壁區','鹽水區','新營區','東山區','北門區','柳營區','學甲區','下營區','六甲區','南化區','將軍區','楠西區','麻豆區','官田區','佳里區','大內區','七股區','玉井區','善化區','西港區','山上區','安定區','新市區','左鎮區','新化區','永康區','歸仁區','關廟區','龍崎區','仁德區']),
  //   area(city:"連江縣" ,arealist: ['南竿鄉','北竿鄉','莒光鄉','東引鄉']),
  //   area(city:'金門縣' ,arealist: ['金城鎮','金湖鎮','金沙鎮','金寧鄉','烈嶼鄉','烏坵鄉']),
  // ];

  var cityName;
  Weather? _weather;
  Map<String, String> ?data;
  Position? _currentPosition;
  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _currentPosition = position;
    });
    Weather? weather= await postRequest();
    setState(() {
      _weather=weather;
    });
  }
  @override
  Widget build(BuildContext context) {
    // for(int i=0;i<list.length;i++){
    //   cityName?.add(list[i].getCity());
    // }
    // var downvalue=list[0].city;
    // _weather=postRequest() as Weather?;
    return  Scaffold(
      body:
      ListView(
        children : [

          SizedBox(height: 20),
          if(_weather!=null)Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Column(
                //   children: [
                if (_weather != null)Text("${_weather!.cityName} ${_weather!.areaName}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),),
                if (_weather != null)Text(time,style: TextStyle(fontSize: 25,color: Colors.white),),
                // ],
                // ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if(_weather!=null)Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(12),
                    ),child: Icon(Icons.water_drop,),
                  ),
                  if(_weather!=null)Text("${_weather!.rain}%",style: TextStyle(color: Colors.white))
                ],
              ),
              if(_weather!=null)Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),child: Icon(Icons.air,),
                  ),
                  if(_weather!=null)Text("${_weather!.wind}m/s",style: TextStyle(color: Colors.white),)
                ],
              ),
              if(_weather!=null)Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),child: Icon(Icons.thermostat,),
                  ),
                  if(_weather!=null)Text("${ _weather!.tempMax}/${_weather!.tempMin}\u2103",style: TextStyle(color: Colors.white),)
                ],
              ),
            ],
          ),
          Padding(padding:EdgeInsets.all(30)),
          // if(_weather!=null)Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [Icon(Icons.thermostat,size: 50,color: Colors.white,),if (_weather != null)Text("${_weather!.temp}°C",style: TextStyle(fontSize:50,color: Colors.white ),),SizedBox(height: 30,),Text("推薦穿著\n:${_weather!.recommed}")],
          // ),
          // SizedBox(height: 20,),
          // Container(
          //     padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
          //     child: Text("Today", style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.white),)
          // ),
          if(_weather!=null)Container(
              margin: const EdgeInsets.all(12),
              height: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),),
              child:
              SizedBox(height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context,index){
                    return Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(_weather!=null)Text(_weather!.hourlydt![index],style: TextStyle(fontSize: 23,color: Colors.white),),
                          if(_weather!=null)Text("${_weather!.hourlytemp![index]} \u2103",style: TextStyle(fontSize: 23,color: Colors.white),)
                        ],
                      ),
                    );
                  },
                ),
              )
          ),
          SizedBox(height: 20,),
          if(_weather!=null)Container(
              margin: const EdgeInsets.all(12),
              height: 300,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),),
              child:Column(
                  children: [
                    SizedBox(
                        height: 250,
                        width: 400,
                        child: ListView.builder(
                            itemCount: 13,
                            itemBuilder: (BuildContext context, index){
                              return SizedBox(
                                height: 65,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Container(
                                    //   height: 1,
                                    //   width: 300,
                                    //   color: Colors.white,
                                    // ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            if(_weather!=null)Text("${_weather!.dailydt![index]}",style: TextStyle(fontSize: 15,color: Colors.white),),
                                            Column(children: [Icon(Icons.water_drop,color: Colors.white,),Text("${_weather!.dailyrain![index]}%",style: TextStyle(color: Colors.white),)],),
                                            if(_weather!=null)Text("${_weather!.dailytemp_max![index]}/${_weather!.dailytemp_min![index]} \u2103",style: TextStyle(fontSize: 15,color: Colors.white),),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              );
                            }
                        )
                    )
                  ]
              )
          ),

              Row(children :[
                // DropdownButton(value:downvalue,icon: const Icon(Icons.keyboard_arrow_down),items:cityName, onChanged:(String? value){
                //   setState(() {
                //       downvalue=value;
                //   });
                // }
                // ),
                // DropdownButton(value:downvalue,icon: const Icon(Icons.keyboard_arrow_down),items:cityName, onChanged:(String? value){
                //   setState(() {
                //     downvalue=value;
                //   });
                // }
                // ),
              Container(
              margin: const EdgeInsets.only(top: 200),
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(

                color: Colors.white12,
                borderRadius: BorderRadius.circular(20),),
              child:IconButton(onPressed:()async{ await _getCurrentLocation();},icon:Icon(Icons.gps_fixed,size: 100,),)
              )
             ]
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await _getCurrentLocation();
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.add),
      // ),
    );
  }




  Future postRequest() async {

    Weather? weather;
    var url = Uri.parse("http://192.168.63.248:3000");
    if(_currentPosition!.latitude!=null || _currentPosition!.longitude!=null){
      data = {
        "lat": "${_currentPosition!.latitude}",
        "log": "${_currentPosition!.longitude}"
      };
    }
      // else{
    //   data = {
    //     "city":city,
    //     "area":area
    //   };
    // }
    var body = jsonEncode(data);
    http.Response response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    }
    return weather;
  }

}



