import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';

class Adddata extends StatefulWidget {
  final List<Student> students;

  const Adddata({super.key, required this.students});

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

  // Reusable TextField Widget
  Widget buildTextField({
    required String title,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: controller,

            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.indigo),

              hintText: hint,

              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.indigo, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      backgroundColor: const Color(0xfff2f6ff),

      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),

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

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Text(
                "Student Details",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 25),

              // NAME
              TextField(
                controller: nameController,

                decoration: InputDecoration(
                  labelText: "Student Name",
                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ID
              TextField(
                controller: idController,

                decoration: InputDecoration(
                  labelText: "Student ID",
                  prefixIcon: Icon(Icons.badge),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // BOOK
              TextField(
                controller: bookController,

                decoration: InputDecoration(
                  labelText: "Book Name",
                  prefixIcon: Icon(Icons.book),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // DATE BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: pickDate,

                  icon: const Icon(Icons.calendar_month),

                  label: Text(
                    selectedDate == null
                        ? "Select Due Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.symmetric(vertical: 14),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // SUBMIT BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select date")),
                      );

                      return;
                    }

                    Student newStudent = Student(
                      name: nameController.text,
                      id: idController.text,
                      book: bookController.text,
                      dueDate: selectedDate!,
                    );

                    Navigator.pop(context, newStudent);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.symmetric(vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
