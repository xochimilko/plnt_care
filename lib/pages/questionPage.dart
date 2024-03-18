import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  bool blackSpotSymptoms = false;
  bool powderyMildewSymptoms = false;
  bool dampingOffSymptoms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Questionnaire'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Answer the following questions:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildQuestion('Do you have black spots on leaves?', (value) {
              setState(() {
                blackSpotSymptoms = value!;
              });
            }, blackSpotSymptoms),
            _buildQuestion('Do you have yellow leaves?', (value) {
              setState(() {
                // Update the state of yellow leaves checkbox
              });
            }, false /* Pass the current state of yellow leaves checkbox here */),
            _buildQuestion('Are leaves falling?', (value) {
              setState(() {
                // Update the state of falling leaves checkbox
              });
            }, false /* Pass the current state of falling leaves checkbox here */),
            _buildQuestion('Do you have white patches on leaves?', (value) {
              setState(() {
                powderyMildewSymptoms = value!;
              });
            }, powderyMildewSymptoms),
            _buildQuestion('Is the soil moisture low?', (value) {
              setState(() {
                // Update the state of low soil moisture checkbox
              });
            }, false /* Pass the current state of low soil moisture checkbox here */),
            _buildQuestion('Is it shady?', (value) {
              setState(() {
                // Update the state of shady checkbox
              });
            }, false /* Pass the current state of shady checkbox here */),
            _buildQuestion('Is the soil damp?', (value) {
              setState(() {
                dampingOffSymptoms = value!;
              });
            }, dampingOffSymptoms),
            _buildQuestion('Is it in a humid environment?', (value) {
              setState(() {
                // Update the state of humid environment checkbox
              });
            }, false /* Pass the current state of humid environment checkbox here */),
            _buildQuestion('Is it in a greenhouse?', (value) {
              setState(() {
                // Update the state of greenhouse checkbox
              });
            }, false /* Pass the current state of greenhouse checkbox here */),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _checkDiagnosis();
        },
        tooltip: 'Diseases',
        child: Icon(Icons.local_hospital),
      ),
    );
  }

  Widget _buildQuestion(
    String question,
    void Function(bool?) onChanged,
    bool value,
  ) {
    return CheckboxListTile(
      title: Text(question),
      value: value,
      onChanged: onChanged,
    );
  }

  void _checkDiagnosis() {
    int blackSpotCount = 0;
    int powderyMildewCount = 0;
    int dampingOffCount = 0;

    // Counting the symptoms related to each disease
    if (blackSpotSymptoms) blackSpotCount++;
    if (powderyMildewSymptoms) powderyMildewCount++;
    if (dampingOffSymptoms) dampingOffCount++;

    // Checking the diagnosis based on symptom counts
    if (blackSpotCount >= 2) {
      _showDiagnosis('Black Spot Disease');
    } else if (powderyMildewCount >= 2) {
      _showDiagnosis('Powdery Mildew Disease');
    } else if (dampingOffCount >= 2) {
      _showDiagnosis('Damping Off Disease');
    } else {
      _showDiagnosis('No common diseases matched');
    }
  }

  void _showDiagnosis(String diagnosis) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Diagnosis'),
          content: Text(diagnosis),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
