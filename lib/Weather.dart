

class Weather {
  // String? recommed;
  String? cityName;
  String? areaName;
  String? temp;
  String? tempMax;
  String? tempMin;
  String? wind;
  String? rain;
  List<String>? hourlydt;
  List<String>? hourlytemp;
  List<String>? dailytemp_max;
  List<String>? dailytemp_min;
  List<String>? dailydt;
  List<String>? dailyrain;
  Weather({
    // this.recommed,
    this.cityName,
    this.areaName,
    this.temp ,
    this.wind ,
    this.rain ,
    this.hourlydt ,
    this.hourlytemp ,
    this.dailydt ,
    this.dailytemp_max ,
    this.dailytemp_min,
    this.dailyrain
});
   Weather.fromJson(Map<String, dynamic> json) {
    // recommed=json[""];
    cityName=json['city'];
    areaName=json["parameter"][2]["parameterValue"];
    temp=json["todayWeatherElement"][3]["elementValue"];
    wind=json["todayWeatherElement"][2]["elementValue"];
    tempMax=json["todayWeatherElement"][10]["elementValue"];
    tempMin=json["todayWeatherElement"][12]["elementValue"];
    rain= json["weatherElement"][0]["time"][0]["elementValue"][0]["value"];
    hourlydt=[
      json["weatherElement"][3]["time"][1]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][2]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][3]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][4]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][5]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][6]["dataTime"].toString().substring(11,16),
      json["weatherElement"][3]["time"][7]["dataTime"].toString().substring(11,16),];
    hourlytemp=[
      json["weatherElement"][3]["time"][1]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][2]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][3]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][4]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][5]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][6]["elementValue"][0]["value"],
      json["weatherElement"][3]["time"][7]["elementValue"][0]["value"],];
    dailydt=[
      json["sevenDayWeatherElement"][1]["time"][0]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][0]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][1]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][1]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][2]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][2]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][3]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][3]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][4]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][4]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][5]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][5]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][6]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][6]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][7]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][7]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][8]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][8]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][9]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][9]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][10]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][10]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][11]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][11]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][12]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][12]["startTime"].toString().substring(11,16),
      json["sevenDayWeatherElement"][1]["time"][13]["startTime"].toString().substring(0,11)+"\n"+json["sevenDayWeatherElement"][1]["time"][13]["startTime"].toString().substring(11,16),
    ];
    dailytemp_max=[
      json["sevenDayWeatherElement"][12]["time"][0]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][1]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][2]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][3]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][4]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][5]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][6]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][7]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][8]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][9]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][10]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][11]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][12]["elementValue"][0]["value"],
     json["sevenDayWeatherElement"][12]["time"][13]["elementValue"][0]["value"],

    ];
    dailytemp_min=[
      json["sevenDayWeatherElement"][8]["time"][0]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][1]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][2]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][3]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][4]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][5]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][6]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][7]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][8]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][9]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][10]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][11]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][12]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][8]["time"][13]["elementValue"][0]["value"],

    ];
    dailyrain=[
      json["sevenDayWeatherElement"][0]["time"][0]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][1]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][2]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][3]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][4]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][5]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][6]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][7]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][8]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][9]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][10]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][11]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][12]["elementValue"][0]["value"],
      json["sevenDayWeatherElement"][0]["time"][13]["elementValue"][0]["value"],

    ];
  }
  //

}