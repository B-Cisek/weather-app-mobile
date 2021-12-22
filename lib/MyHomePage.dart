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
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Pogoda'),
          BottomNavigationBarItem(icon: Icon(Icons.air_rounded), label: 'Powietrze'),
        ],
      ),
    );
  }
}
