import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  PanelController _pc = new PanelController();

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
                      RichText(
                          text: TextSpan(
                              text: "CAQI ⓘ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _pc.open();
                                },
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.2,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300)))),
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
        ),
        SlidingUpPanel(
          minHeight: 0,
          maxHeight: 300,
          controller: _pc,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5)),
          panel: Stack(fit: StackFit.expand, children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 32.0)),
                  Text(
                    "Index CAQI",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  Text(
                    "Indeks CAQI (ang. Common Air Quality Index) pozwala przedstawić sytuację w Europiie w porównywalny i łatwy do zrozumienia sposób. Wartość indeksu jest prezentowana w postaci jednej liczby. Skala ma rozpietość od 0 do wartości powyżej 100 i powyżej bardzo zanieczyszone. Im wyższa wartość wskażnika, tym większe ryzyko złego wpływu na zdrowie i sampoczucie.",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            height: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  Text(
                    "Pył zawieszony PM2,5 i PM10",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  Text(
                    "Pyły zawieszone to mieszanina bardzo małych cząstek. PM10 to wszystkie pyły mniejsze niz 10μm, natomiast w przypadku  PM2,5 nie większe niż 2,5μm. Zanieczyszczenia pyłowe mają zdolność do adsorpcji swojej powierzchni innych, bardzo szkodliwych związków chemicznych: dioksyn, furanów, metali ciężkich, czy benzo(a)pirenu - najbardziej toksycznego skłądnika smogu.",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            height: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 16)
                    ),
                    onPressed: (){
                      _pc.close();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),

                  )),
                )
          ]),
        )
      ]),
    );
  }

  bool havePermission() {
    return true;
  }

  LinearGradient getGradientByMood(AirQuality? air) {
    if (air!.isGood) {
      return const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff4ACF8C), Color(0xff75EDA6)]);
    } else if (air.isBad) {
      return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffFBDA61), Color(0xffF76B1C)]);
    } else {
      return const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xffF4003A), Color(0xffFF8888)]);
    }
  }

  Color getBackgroundTextColor(AirQuality? air) {
    if (air!.isGood || air.isBad) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  getAdviceImage(AirQuality? air) {
    if (air!.isGood) {
      return AssetImage('icons/happy.png');
    } else if (air.isBad) {
      return AssetImage('icons/ok.png');
    } else {
      return AssetImage('icons/sad.png');
    }
  }
}
