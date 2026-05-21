import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';

class EditData extends StatefulWidget {
  final Student student;
  const EditData({super.key, required this.student});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
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

  void updatedata() {
    widget.student.name = nameController.text;
    widget.student.id = idController.text;
    widget.student.book = bookController.text;

    if (selectedDate != null) {
      widget.student.dueDate = selectedDate!;
    }
  }

  @override
  void initState() {
    super.initState();

    nameController.text = widget.student.name;
    idController.text = widget.student.id;
    bookController.text = widget.student.book;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Student"),
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
                "Update Student",
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
                        ? "${widget.student.dueDate.day}/${widget.student.dueDate.month}/${widget.student.dueDate.year}"
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

              // UPDATE BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    updatedata();
                    Navigator.pop(context, true);
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
                    "Update",
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
