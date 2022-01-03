import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/MyHomePage.dart';
import 'package:weather_app/PermissionScreen.dart';
import 'package:weather_app/WeatherScreen.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              color: Color(0xffffffff),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xff6671e5), Color(0xff4852d9)])),
        ),
        Align(
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('icons/cloud-sun.png'),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              Text(Strings.appTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Text('Aplikacja do monitorowania \n pogody i jakości powietrza',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))),
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: Container(
              alignment: Alignment.center,
              child: Text("Ładowanie...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300))),
            ))
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    if(permissionDenied()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    }else{
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  bool permissionDenied() {
    return false;
  }

  // Pobieranie danych openweathermap.org
  void executeOnceAfterBuild() async {
    WeatherFactory wf = new WeatherFactory("5fe72a5e5cffddd2e43c01d6adb9f61e", language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName("New York");
    log(w.toJson().toString());

    var lat = 33.5891854711342;
    var lon = 114.02932921985227;

    String _endpoint = 'https://api.waqi.info/feed/';
    var keyword = 'geo:$lat;$lon';
    var key = '23b9dbb9ec81066f3d86004fb6363e9ae385ddaa';
    String url = '$_endpoint/$keyword/?token=$key';

    http.Response response = await http.get(Uri.parse(url));

    log(response.body.toString());

    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = new AirQuality(jsonBody);


    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyHomePage(weather: w, air: aq)));
  }
}

class AirQuality{
  bool isGood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int aqi = 0;
  int pm25 = 0;
  int pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody){
    aqi = int.tryParse(jsonBody['data']['aqi'].toString())?? -1;
    pm10 = int.tryParse(jsonBody['data']['iaqi']['pm25']['v'].toString())?? -1;
    pm25 = int.tryParse(jsonBody['data']['iaqi']['pm10']['v'].toString())?? -1;
    station = jsonBody['data']['city']['name'].toString();
    setupLevel(aqi);
  }

  void setupLevel(int aqi) {
    if(aqi <= 100){
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrza i wyjdź na spacer";
      isGood = true;
    }else if(aqi <= 150){
      quality = "Nie za dobra";
      advice = "Jeśli tylko możesz zostań w domu";
      isBad = true;
    }else{
      quality = "Bardzo zła";
      advice = "Zdecydowanie zostań w domu!";
    }
  }
}
