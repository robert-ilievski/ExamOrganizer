import 'package:exam_organizer/exam_card.dart';
import 'package:exam_organizer/exam_form.dart';
import 'package:flutter/material.dart';

import 'exam.dart';
import 'exam_calendar.dart';
import 'login.dart';

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
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => Scaffold(
          appBar: AppBar(
            title: Text('ExamOrganizer 181523'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarScreen(exams),
                    ),
                    // arguments: {'onAddAccount': onAddAccount},
                  );
                },
                icon: Icon(Icons.calendar_month),
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
      },
      initialRoute: "/login",
    );
  }
}
