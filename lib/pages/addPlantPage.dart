import 'package:flutter/material.dart';
import 'package:plantapp/plant.dart';
import 'package:plantapp/plantProvider.dart';
import 'package:provider/provider.dart';

class AddPlantPage extends StatelessWidget {
  final TextEditingController _plantController = TextEditingController();

  void _addPlant(BuildContext context) {
    final plantText = _plantController.text;
    if (plantText.isNotEmpty) {
      Provider.of<PlantProvider>(context, listen: false).addPlant(
        PlantThing(
          id: DateTime.now().toString(),
          title: plantText,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Plant'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _plantController,
              decoration: InputDecoration(labelText: 'Plant'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addPlant(context),
              child: Text('Add New Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
