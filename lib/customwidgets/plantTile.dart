import 'package:flutter/material.dart';

class PlantTile extends StatelessWidget {
  final String title;
  PlantTile({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
