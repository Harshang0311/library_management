import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';
//import 'package:library_management/widgets/placeholder.dart';

class Adddata extends StatefulWidget {
  final List<Student> students;
  Adddata({super.key, required this.students});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController bookController = TextEditingController();
  DateTime? selectedDate;
  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 300,

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Column(
            children: [
              SizedBox(height: 20),

              Text(
                "Add Student",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 30),

              // NAME
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                child: Row(
                  children: [
                    SizedBox(
                      width: 100,

                      child: Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Enter Student Name",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // ID
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                child: Row(
                  children: [
                    SizedBox(
                      width: 100,

                      child: Text(
                        "ID:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          hintText: "Enter Student ID",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // BOOK NAME
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                child: Row(
                  children: [
                    SizedBox(
                      width: 100,

                      child: Text(
                        "Book:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        controller: bookController,
                        decoration: InputDecoration(
                          hintText: "Enter Book Name",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                child: Row(
                  children: [
                    SizedBox(
                      width: 100,

                      child: Text(
                        "Due Date:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDate,

                        child: Text(
                          selectedDate == null
                              ? "Select Date"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Student newStudent = Student(
                    name: nameController.text,
                    id: idController.text,
                    book: bookController.text,
                    dueDate: selectedDate!,
                  );
                  widget.students.add(newStudent);
                  Navigator.pop(context, widget.students);
                },
                child: Text("Submit!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
