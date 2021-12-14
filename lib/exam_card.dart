import 'package:flutter/material.dart';

import 'exam.dart';

class ExamCard extends StatelessWidget {
  Exam _exam;

  ExamCard(this._exam);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        child: ListTile(
          leading: Icon(Icons.school),
          title: Text(
            _exam.getName(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Container(
            child:
                Text(
                    'Date: ' + _exam.getDate() + ', Time: ' + _exam.getTime(),
                  style: TextStyle(color: Colors.grey),
                ),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          ),
        ),
      ),
    );
  }
}
