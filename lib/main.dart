import 'package:exam_organizer/exam_card.dart';
import 'package:exam_organizer/exam_form.dart';
import 'package:flutter/material.dart';

import 'exam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Exam> exams = [];

  void onAddExam(String name, String date, String time) {
    Exam newExam = Exam(name, date, time);
    setState(() {
      exams.add(newExam);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam organizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ExamOrganizer 181523'),
          actions: [
            IconButton(
              onPressed: () {
                print('Implement navigation to a new page.');
              },
              icon: Icon(Icons.add_to_photos_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 20, 0, 10),
                  child: Text(
                    "Add Exam",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                      ExamForm(onAddExam: onAddExam),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 20, 0, 10),
                  child: Text(
                    "Scheduled Exams",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  return ExamCard(exams[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
