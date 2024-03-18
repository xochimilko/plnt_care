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
            _buildQuestion('Do you have black spots on leaves?'),
            _buildQuestion('Do you have yellow leaves?'),
            _buildQuestion('Are leaves falling?'),
            _buildQuestion('Do you have white patches on leaves?'),
            _buildQuestion('Is the soil moisture low?'),
            _buildQuestion('Is it shady?'),
            _buildQuestion('Is the soil damp?'),
            _buildQuestion('Is it in a humid environment?'),
            _buildQuestion('Is it in a greenhouse?'),
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

  Widget _buildQuestion(String question) {
    return CheckboxListTile(
      title: Text(question),
      value: false,
      onChanged: (value) {
        // Do nothing for now, just to display questions
      },
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
