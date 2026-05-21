import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';
//import 'package:library_management/widgets/placeholder.dart';
// import 'package:library_management/widgets/edit.dart';
// import 'package:library_management/widgets/add.dart';

class WidgetPage extends StatefulWidget {
  final List<Student> students;

  const WidgetPage({super.key, required this.students});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  DateTime? selectedDate;

  // Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<Student> get filteredStudents {
    if (selectedDate == null) {
      return widget.students;
    }

    return widget.students.where((student) {
      return student.dueDate.day == selectedDate!.day &&
          student.dueDate.month == selectedDate!.month &&
          student.dueDate.year == selectedDate!.year;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Library Management"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: pickDate,
                  child: Text(
                    selectedDate == null
                        ? "Select Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ),
                  if (selectedDate != null) ...[
                    const SizedBox(width: 8), 
                    SizedBox(
                        height: 40, 
                        child: FloatingActionButton.extended(
                          // backgroundColor: Colors.red.shade50, 
                          // foregroundColor: Colors.red,
                          elevation: 0, 
                          onPressed: () {
                            setState(() {
                              selectedDate = null; 
                            });
                          },
                          
                          label: const Text("Clear Filter"),)
                    ),
                  ],

                Spacer(),

            SizedBox(    
            child:FloatingActionButton.extended(
              elevation: 0,
              onPressed: () async {
                final Student? newStudent = await Navigator.pushNamed(context, '/add') as Student?;
                
                if (newStudent != null) {
                  setState(() {
                    widget.students.add(newStudent);
                  });
                }
              },
              label: const Icon(Icons.add),
            ),)
              ],
            ),
            const SizedBox(height: 40),

            Expanded(
              child: filteredStudents.isEmpty
                  ? const Center(
                      child: Text(
                        "No Due Students",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredStudents.length,
                      itemBuilder: (context, index) {
                        Student student = filteredStudents[index];
                        var column = Column(
                          children: [
                            Text("Submitted"),
                            Checkbox(
                              value: student.submitted,
                              onChanged: (value) {
                                setState(() {
                                  student.submitted = value!;
                                });
                              },
                            ),
                          ],
                        );
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
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
                              ),

                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () async{
                                            final result= await Navigator.pushNamed(
                                              context, 
                                              '/edit', 
                                              arguments: student, 
                                            );
                                          
                                          if(result == true){
                                            setState(() {});
                                          }
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        column, 
                                      ],
                                    ),
                                    SizedBox(height: 10),
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