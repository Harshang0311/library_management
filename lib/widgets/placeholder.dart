import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';
import 'package:library_management/widgets/listview.dart';
import 'package:library_management/widgets/add.dart';
import 'package:library_management/widgets/edit.dart';
import 'package:library_management/widgets/Splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class home_page extends StatefulWidget {
  
  home_page({super.key});

  
@override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  final List<Student> students =[
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

  List<Student> myList = [];

  Future<void> saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(students.map((student) => student.toJson()).toList());
    await prefs.setString('students', jsonString);
  }

Future<void> loadList() async {
  SharedPreferences prefs =
      await SharedPreferences.getInstance();
  String? jsonString =
      prefs.getString('students');
  if (jsonString != null) {
    List decodedList =
        jsonDecode(jsonString);
    setState(() {
      students.clear();
      students.addAll(
        decodedList.map(
          (item) => Student.fromJson(item),
        ),
      );
    });
  }
}

 @override
Widget build(BuildContext context) {
   
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',

    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/splash':
            return MaterialPageRoute(builder: (context) => MyWidget());

        case '/list':
            return MaterialPageRoute(
              builder: (context) => WidgetPage(students: students,saveList: saveList),
            );

        case '/add':
            return MaterialPageRoute(builder: (context) => Adddata(students: students,));

        case '/edit':
            final student = settings.arguments as Student;

            return MaterialPageRoute(
              builder: (context) => EditData(student: student),
            );

         default:
            return MaterialPageRoute(
              builder: (context) =>
                  const Scaffold(body: Center(child: Text('Route Not Found'))),
            );
      }
    }
  );
}
}
