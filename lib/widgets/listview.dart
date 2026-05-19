import 'package:flutter/material.dart';
import 'package:library_management/model/student.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  // Manual Student Data
  List<Student> students = [
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
      name: "haan patel",
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

  DateTime? selectedDate;

  // Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2006),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Filter Data Date Wise
  List<Student> filteredStudents() {
    if (selectedDate == null) {
      return [];
    }

    return students.where((student) {
      return student.dueDate == selectedDate;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        title: const Text("Library Management"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // Top Container
              children: [
                ElevatedButton(
                  onPressed: pickDate,

                  child: Text(
                    selectedDate == null
                        ? "Select Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Add Student Logic Here
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Student List
            Container(
              child: filteredStudents().isEmpty
                  ? const Center(
                      child: Text(
                        "No Due Students",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredStudents().length,

                      itemBuilder: (context, index) {
                        Student student = filteredStudents()[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    student.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text("ID : ${student.id}"),

                                  const SizedBox(height: 5),

                                  Text("Book : ${student.book}"),

                                  const SizedBox(height: 5),

                                  Text(
                                    "Due : ${student.dueDate.day}/${student.dueDate.month}/${student.dueDate.year}",
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 169, 52, 52),
                                  
                                ),
                                child: Column(
                                  children: [
                                    const Text("Submitted"),

                                    Checkbox(
                                      value: student.submitted,

                                      onChanged: (value) {
                                        setState(() {
                                          student.submitted = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
