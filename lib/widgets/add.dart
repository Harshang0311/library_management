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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: const Text("Add Student",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      backgroundColor: const Color(0xfff2f6ff),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background1.png'),
            fit: BoxFit.cover,
          ),),

      child:SafeArea(
  child: Center(
    child: Container(
      width: 320,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: SingleChildScrollView(
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

            TextField(
              controller: nameController,

              decoration: InputDecoration(
                labelText: "Student Name",
                prefixIcon: const Icon(Icons.person),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: idController,

              decoration: InputDecoration(
                labelText: "Student ID",
                prefixIcon: const Icon(Icons.badge),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: bookController,

              decoration: InputDecoration(
                labelText: "Book Name",
                prefixIcon: const Icon(Icons.book),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

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

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select date"),
                      ),
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),
     ) );
  }
}