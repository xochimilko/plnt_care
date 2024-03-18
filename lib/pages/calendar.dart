import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendarScreen extends StatefulWidget {
  @override
  _WeeklyCalendarScreenState createState() => _WeeklyCalendarScreenState();
}

class _WeeklyCalendarScreenState extends State<WeeklyCalendarScreen> {
  List<String> tasks = [
    'Watering',
    'Root check',
    'Fertilizer',
    'Watering',
    'Root check',
    'Fertilizer',
    'Rest day',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Calendar'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Day ${index + 1}: ${tasks[index]}'),
            onTap: () {
              _editTask(index);
            },
          );
        },
      ),
    );
  }

  void _editTask(int dayIndex) {
    String task = tasks[dayIndex];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(text: task);
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks[dayIndex] = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
