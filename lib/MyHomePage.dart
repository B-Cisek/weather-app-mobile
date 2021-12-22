import 'package:flutter/material.dart';
import 'package:weather_app/AirScreen.dart';
import 'package:weather_app/WeatherScreen.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  final screens = [
    WeatherScreen(),
    AirScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 38,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.wb_cloudy_outlined), label: 'Pogoda'),
          BottomNavigationBarItem(icon: Icon(Icons.air_rounded), label: 'Powietrze'),
        ],
      ),
    );
  }
}
