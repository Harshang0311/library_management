import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';
import 'package:library_management/widgets/placeholder.dart';

class WidgetPage extends StatefulWidget {
  final List<Student> students;
  final Future<void> Function() saveList;

  const WidgetPage({
    super.key,
    required this.students,
    required this.saveList,
  });

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  DateTime? selectedDate;

  // DATE PICKER
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

  // FILTER
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

      backgroundColor: const Color(0xfff2f6ff),

      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: const Text("Book Return System",style: TextStyle(color: Colors.white),),

        centerTitle: true,

        backgroundColor: Colors.blue,

        elevation: 2,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // TOP BUTTONS
            Row(
              children: [

                // DATE BUTTON
                ElevatedButton.icon(
                  onPressed: pickDate,

                  icon: const Icon(Icons.calendar_month),

                  label: Text(
                    selectedDate == null
                        ? "Select Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    elevation: 5,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // CLEAR FILTER
                if (selectedDate != null) ...[
                  const SizedBox(width: 10),

                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedDate = null;
                      });
                    },

                    icon: const Icon(Icons.clear),

                    label: const Text("Clear"),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,

                      elevation: 5,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],

                const Spacer(),

                // ADD BUTTON
                FloatingActionButton.extended(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,

                  elevation: 5,

                  onPressed: () async {

                    final Student? newStudent =
                        await Navigator.pushNamed(
                              context,
                              '/add',
                            )
                            as Student?;

                    if (newStudent != null) {

                      setState(() {
                        widget.students.add(newStudent);
                      });

                      await widget.saveList();
                    }
                  },

                  icon: const Icon(Icons.add),

                  label: const Text("Add"),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // LIST
            Expanded(
              child: filteredStudents.isEmpty
                  ? const Center(
                      child: Text(
                        "No Due Students",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredStudents.length,

                      itemBuilder: (context, index) {

                        Student student = filteredStudents[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),

                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(15),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // LEFT SIDE
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      student.name,

                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Text(
                                      "ID : ${student.id}",

                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "Book : ${student.book}",

                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "Due : ${student.dueDate.day}/${student.dueDate.month}/${student.dueDate.year}",

                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // RIGHT SIDE
                              Column(
                                children: [

                                  // EDIT BUTTON
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,

                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),

                                    child: IconButton(
                                      onPressed: () async {

                                        final result =
                                            await Navigator.pushNamed(
                                              context,
                                              '/edit',
                                              arguments: student,
                                            );

                                        if (result == true) {

                                          setState(() {});

                                          await widget.saveList();
                                        }
                                      },

                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  const Text(
                                    "Submitted",

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Checkbox(
                                    activeColor: Colors.blue,

                                    value: student.submitted,

                                    onChanged: (value) async {

                                      setState(() {
                                        student.submitted = value!;
                                      });

                                      await widget.saveList();
                                    },
                                  ),
                                ],
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