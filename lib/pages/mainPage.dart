import 'package:flutter/material.dart';
import 'package:plantapp/pages/homePage.dart';
import 'package:plantapp/pages/questionPage.dart';
import 'package:plantapp/plantProvider.dart';
import 'package:provider/provider.dart';

import '../pages/addPlantPage.dart';
import 'calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State {
  int currentPageIndex = 0;

  final List _pages = [
    HomePage(),
    WeeklyCalendarScreen(),
    QuestionnaireScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green[300],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_mini_outlined),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
          NavigationDestination(
              icon: Icon(Icons.question_mark), label: 'Diagnose Plant'),
        ],
      ),
    );
  }
}
