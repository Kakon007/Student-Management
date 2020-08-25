import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_manag/Student_Model/StudentModel.dart';
import 'package:student_manag/services/FirestoreServices.dart';
import 'package:uuid/uuid.dart';

class StudentProvider with ChangeNotifier {
  final firestoreService = FirestoreServices();

  String _name;
  String _id;
  String _department;
  String _batch;
  String _cgpa;

  //Getter

  String get name => _name;
  String get id => _id;
  String get department => _department;
  String get batch => _batch;
  String get cgpa => _cgpa;

  //Setter
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeId(String value) {
    _id = value;
    notifyListeners();
  }

  changeDepartment(String value) {
    _department = value;
    notifyListeners();
  }

  changeBatch(String value) {
    _batch = value;
    notifyListeners();
  }

  changeCgpa(String value) {
    _cgpa = value;
    notifyListeners();
  }

  createInfo() {
    final studentModelData = StudentModel(
        studentName: name,
        studentID: id,
        studentDepartment: department,
        studentBatch: batch,
        currentCgpa: cgpa);
    firestoreService.createInfo(studentModelData);
  }

  loadValues(StudentModel studentModel) {
    _name = studentModel.studentName;
    _batch = studentModel.studentBatch;
    _department = studentModel.studentDepartment;
    _id = studentModel.studentID;
    _cgpa = studentModel.currentCgpa;
  }

  removeId(String studentId) {
    firestoreService.removeData(studentId);
  }

  // readInfo() {
  //   DocumentReference documentReference =
  //       Firestore.instance.collection('student').document(id);

  //   documentReference.get().then((datasnapshot) {
  //     print("Name:" + datasnapshot.data['name']);
  //     print("ID:" + datasnapshot.data['id']);
  //     print("Department:" + datasnapshot.data['department']);
  //     print("Batch:" + datasnapshot.data['batch']);
  //   });
  // }

  // readAllData(){
  //    StreamBuilder(
  //        stream: Firestore.instance.collection('Student Management').snapshots(),
  //        builder: (context,snapshot){
  //          return ListView(
  //            children:viewListItem(snapshot);
  //          );
  //        });

  //    List<Widget> viewListItem(AsyncSnapshot snapshot){
  //      return snapshot.data.documents.map((documents){
  //        return Text('Data');
  //      }).toList();
  //    }

}
