import 'package:flutter/material.dart';
import 'package:plantapp/customwidgets/plantTile.dart';
import 'package:plantapp/plantProvider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/foundation.dart';
import 'addPlantPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plants = Provider.of<PlantProvider>(context).plants;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Plants'),
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (ctx, index) {
          final aPlant = plants[index];
          return PlantTile(
            title: aPlant.title,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddPlant');
          //print('Potato');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
