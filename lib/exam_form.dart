import 'package:flutter/material.dart';

class ExamForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Function(String name, String date, String time) onAddExam;

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  ExamForm({required this.onAddExam});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Exam name"),
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'Exam name is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextFormField(
              controller: dateController,
              decoration:
                  InputDecoration(hintText: "Exam date in format yyyy-mm-dd"),
              validator: (date) {
                if (date == null || date.isEmpty) {
                  return 'Exam date is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextFormField(
              controller: timeController,
              decoration: InputDecoration(hintText: "Exam time"),
              validator: (time) {
                if (time == null || time.isEmpty) {
                  return 'Exam time is required';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  onAddExam(nameController.text, dateController.text,
                      timeController.text);
                }
              },
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
