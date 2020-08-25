import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manag/HomePage.dart';
import 'package:student_manag/Student_Model/StudentModel.dart';

class Data extends StatelessWidget {
  const Data({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stdData = Provider.of<List<StudentModel>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Data'),
        ),
        body: (stdData != null)
            ? ListView.builder(
                itemCount: stdData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: [
                        Text(stdData[index].studentName),
                        Text(stdData[index].studentID),
                        Text(stdData[index].studentDepartment),
                        Text(stdData[index].studentBatch),
                        Text(stdData[index].currentCgpa),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomePage(stdData[index])),
                      );
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
