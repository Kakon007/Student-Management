import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_manag/provider/Student_Provider.dart';
import 'package:student_manag/services/FirestoreServices.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreServices = FirestoreServices();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        StreamProvider(
          create: (context) => firestoreServices.getId(),
        )
      ],
      child: MaterialApp(
        title: 'Student Management',
        home: HomePage(),
      ),
    );
  }
}
