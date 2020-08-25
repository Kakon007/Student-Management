import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manag/Student_Model/StudentModel.dart';
import 'package:student_manag/provider/Student_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'datashow.dart';

class HomePage extends StatefulWidget {
  final StudentModel data;

  HomePage([this.data]);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final depController = TextEditingController();
  final batchController = TextEditingController();
  final cgController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    depController.dispose();
    batchController.dispose();
    cgController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.data == null) {
      nameController.text = '';
      idController.text = '';
      depController.text = '';
      batchController.text = '';
      cgController.text = '';
      new Future.delayed(Duration.zero, () {
        final studentProvider =
            Provider.of<StudentProvider>(context, listen: false);
        studentProvider.loadValues(StudentModel());
      });
    } else {
      //Controller updated
      nameController.text = widget.data.studentName;
      idController.text = widget.data.studentID;
      depController.text = widget.data.studentDepartment;
      batchController.text = widget.data.studentBatch;
      cgController.text = widget.data.currentCgpa;

      //Passing new Data to model Peovider class
      //or we can say state update
      new Future.delayed(Duration.zero, () {
        final studentProvider =
            Provider.of<StudentProvider>(context, listen: false);
        studentProvider.loadValues(widget.data);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Student Name',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        studentProvider.changeName(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: 'Student ID',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        studentProvider.changeId(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: depController,
                      decoration: InputDecoration(
                        labelText: 'Department',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        studentProvider.changeDepartment(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: batchController,
                      decoration: InputDecoration(
                        labelText: 'Batch',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        studentProvider.changeBatch(value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: cgController,
                      decoration: InputDecoration(
                        labelText: 'Current CGPA',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        studentProvider.changeCgpa(value);
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Create'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            studentProvider.createInfo();
                            print('Your Info created');
                          },
                        ),
                        RaisedButton(
                          child: Text('Read'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Data()));
                          },
                        ),
                        RaisedButton(
                          child: Text('Update'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.orange,
                          onPressed: () {
                            studentProvider.createInfo();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Data()));
                          },
                        ),
                        (widget.data != null)
                            ? RaisedButton(
                                child: Text('Delete'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.red,
                                onPressed: () {
                                  studentProvider
                                      .removeId(widget.data.studentID);
                                  Navigator.of(context).pop();
                                },
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
