import 'package:flutter/material.dart';
import 'package:plantapp/pages/addPlantPage.dart';
import 'package:plantapp/pages/homePage.dart';
import 'package:plantapp/pages/mainPage.dart';
import 'package:plantapp/plantProvider.dart';
import 'package:provider/provider.dart';
import './pages/mainPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PlantProvider(),
        child: MaterialApp(title: 'Plant App', initialRoute: '/', routes: {
          '/': (context) => MainPage(),
          '/AddPlant': (context) => AddPlantPage(),
        }));
  }
}
