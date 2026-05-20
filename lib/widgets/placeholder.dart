import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';
import 'package:library_management/widgets/listview.dart';
//import 'package:library_management/widgets/add.dart';

class home_page extends StatefulWidget {
  
  home_page({super.key});

  
@override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  final List <Student> students =[
    Student(
      name: "Jimit Patel",
      id: "474",
      book: "Flutter",
      dueDate: DateTime(2026, 5, 22),
    ),

    Student(
      name: "Harshang patel",
      id: "471",
      book: "Java",
      dueDate: DateTime(2026, 5, 22),
    ),

    Student(
      name: "Meet chovatiya",
      id: "476",
      book: "Java",
      dueDate: DateTime(2026, 5, 22),
    ),

    Student(
      name: "haan patel",
      id: "477",
      book: "Java",
      dueDate: DateTime(2026, 5, 22),
    ),

    Student(
      name: "Amit Kumar",
      id: "103",
      book: "Python",
      dueDate: DateTime(2026, 5, 25),
    ),
  ];
 @override
Widget build(BuildContext context) {

  return Scaffold(

    body: WidgetPage(
      students: students,
      
    ),
  );
}
}
