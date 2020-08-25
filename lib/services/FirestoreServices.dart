import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_manag/Student_Model/StudentModel.dart';

class FirestoreServices {
  final Firestore _db = Firestore.instance;
  Future<void> createInfo(StudentModel studentModel) {
    return _db
        .collection('student')
        .document(studentModel.studentID)
        .setData(studentModel.toMap());
  }

  Stream<List<StudentModel>> getId() {
    return _db.collection('student').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => StudentModel.fromFirestore(document.data))
        .toList());
  }

  Future<void> removeData(String studentId) {
    return _db.collection('student').document(studentId).delete();
  }
}
