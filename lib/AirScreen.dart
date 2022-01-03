import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/MyHomePage.dart';
import 'package:weather_app/PermissionScreen.dart';
import 'package:weather_app/SplashScreen.dart';

import 'main.dart';

class AirScreen extends StatefulWidget {
  AirScreen({this.air});

  final AirQuality? air;

  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              gradient: getGradientByMood(widget.air)),
        ),
        Align(
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Jakość powietrza",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: getBackgroundTextColor(widget.air),
                          fontWeight: FontWeight.w300))),
              Padding(padding: EdgeInsets.only(top: 2)),
              Text(widget.air!.quality,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          height: 1.2,
                          color: getBackgroundTextColor(widget.air),
                          fontWeight: FontWeight.w700))),
              Padding(padding: EdgeInsets.only(top: 24)),
              CircleAvatar(
                radius: 91.0,
                backgroundColor: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((widget.air!.aqi / 200 * 100).floor().toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 64.0,
                                  height: 1.2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Text("CAQI ⓘ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300))),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 28)),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('PM 2,5',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.2,
                                      color: getBackgroundTextColor(widget.air),
                                      fontWeight: FontWeight.w400))),
                          Padding(padding: EdgeInsets.only(top: 2.0)),
                          Text(widget.air!.pm25.toString() + "%",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 22.0,
                                      height: 1.2,
                                      color: getBackgroundTextColor(widget.air),
                                      fontWeight: FontWeight.w700)))
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 24,
                      color: getBackgroundTextColor(widget.air),
                      thickness: 1,
                    ),
                    Container(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("PM 10",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.2,
                                      color: getBackgroundTextColor(widget.air),
                                      fontWeight: FontWeight.w400))),
                          Padding(padding: EdgeInsets.only(top: 2.0)),
                          Text(
                            widget.air!.pm10.toString() + "%",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    color: getBackgroundTextColor(widget.air),
                                    fontWeight: FontWeight.w700)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("Stacja pomiarowa",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: getBackgroundTextColor(widget.air),
                          fontWeight: FontWeight.w300))),
              Padding(padding: EdgeInsets.only(top: 8)),
              Text(widget.air!.station.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: getBackgroundTextColor(widget.air),
                          fontWeight: FontWeight.w400)))
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 62.0, left: 10, bottom: 14),
                    child: Divider(
                      height: 10,
                      color: Colors.black,
                      thickness: 1,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 24),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            height: 38.0,
                            color: Colors.white,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      alignment: Alignment.centerLeft,
                                      image: getAdviceImage(widget.air)),
                                  Padding(padding: EdgeInsets.only(left: 8.0)),
                                  Text(
                                    widget.air!.advice,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 12.0,
                                            height: 1.2,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ],
                              ),
                            )))),
              ],
            ),
          ),
        )
      ]),
    );
  }

  bool havePermission() {
    return true;
  }

  LinearGradient getGradientByMood(AirQuality? air) {
      if (air!.isGood) {
        return LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xff4ACF8C), Color(0xff75EDA6)]);
      } else if (air.isBad) {
        return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffFBDA61), Color(0xffF76B1C)]);
      } else {
        return LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xffF4003A), Color(0xffFF8888)]);
      }
    }

  Color getBackgroundTextColor(AirQuality? air) {
    if(air!.isGood || air.isBad){
      return Colors.black;
    }else{
      return Colors.white;
    }
  }

  getAdviceImage(AirQuality? air) {
    if(air!.isGood){
      return AssetImage('icons/happy.png');
    }else if(air.isBad){
      return AssetImage('icons/ok.png');
    }else{
      return AssetImage('icons/sad.png');
    }
  }
}
