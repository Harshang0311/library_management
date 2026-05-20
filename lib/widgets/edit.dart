import 'package:flutter/material.dart';
import 'package:library_management/widgets/student.dart';


class EditData extends StatefulWidget {
  final Student student;
  const EditData({super.key,required this.student});

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

  void updatedata(){
    widget.student.name=nameController.text;
    widget.student.id=idController.text;
    widget.student.book=bookController.text;

    if(selectedDate != null){
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
      appBar: AppBar(),
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
                "Update Student Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                              ? "${widget.student.dueDate.day}/${widget.student.dueDate.month}/${widget.student.dueDate.year}"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed:(){updatedata();Navigator.pop(context, true);}, child: Text("Update")),
            ],
          ),
        ),
      ),
    );
  }
}