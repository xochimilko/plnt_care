import 'package:flutter/foundation.dart';
import 'package:plantapp/plant.dart';

class PlantProvider with ChangeNotifier {
  List<PlantThing> _plants = [];

  List<PlantThing> get plants {
    return [..._plants];
  }

  void addPlant(PlantThing aPlant) {
    _plants.add(aPlant);
    notifyListeners();
  }
}
