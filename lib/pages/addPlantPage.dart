import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPlantPage extends StatefulWidget {
  const AddPlantPage({super.key});
  @override
  State<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  String selectedWaterVal = 'Weekly'; //default value
  String selectedRootVal = 'Weekly';
  String selectedFerVal = 'Weekly';
  List<String> frequencies = [
    "Once a day",
    "Once every three days",
    "Weekly",
    "Once a month"
  ];
  var frequencyMap = {
    'everyday': 1,
    'every three days': 3,
    'weekly': 7,
    'monthly': 30,
  };
  Map<DateTime, List> eventsList = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              const Text('Plant Name'),
              const TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter plant name',
                      border: OutlineInputBorder())),
              const Text('Enter watering frequency'),
              DropdownMenu<String>(
                  onSelected: (String? freq) {
                    setState(() {
                      if (freq != null) {
                        selectedWaterVal = freq;
                      }
                    });
                  },
                  dropdownMenuEntries: frequencyMap.keys
                      .map<DropdownMenuEntry<String>>((String frequencyKey) {
                    return DropdownMenuEntry<String>(
                      value: frequencyKey,
                      label: frequencyKey,
                      enabled: true,
                    );
                  }).toList()),
              const Text('Enter root check frequency'),
              DropdownMenu<String>(
                  onSelected: (String? freq) {
                    setState(() {
                      if (freq != null) {
                        selectedRootVal = freq;
                      }
                    });
                  },
                  dropdownMenuEntries: frequencyMap.keys
                      .map<DropdownMenuEntry<String>>((String frequencyKey) {
                    return DropdownMenuEntry<String>(
                      value: frequencyKey,
                      label: frequencyKey,
                      enabled: true,
                    );
                  }).toList()),
              const Text('Enter fertilizer frequency'),
              DropdownMenu<String>(
                  onSelected: (String? freq) {
                    setState(() {
                      if (freq != null) {
                        selectedFerVal = freq;
                      }
                    });
                  },
                  dropdownMenuEntries: frequencyMap.keys
                      .map<DropdownMenuEntry<String>>((String frequencyKey) {
                    return DropdownMenuEntry<String>(
                      value: frequencyKey,
                      label: frequencyKey,
                      enabled: true,
                    );
                  }).toList()),
              ElevatedButton(
                onPressed: () {
                  print('submitted');
                  print(selectedFerVal + selectedRootVal + selectedWaterVal);
                },
                child: const Text('Save'),
              ),
            ])));
  }
}
