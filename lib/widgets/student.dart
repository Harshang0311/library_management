//import 'package:flutter/material.dart';
class Student {
  String name;
  String id;
  String book;
  DateTime dueDate;
  bool submitted;

  Student({
    required this.name,
    required this.id,
    required this.book,
    required this.dueDate,
    this.submitted = false,
  });

  Map<String,dynamic>toJson(){
    return{
      'name': name,
      'id':id,
      'book':book,
      'dueDate':dueDate.toIso8601String(),
      'submitted':submitted
    };
  }

  factory Student.fromJson(Map<String,dynamic>json){
    return Student(
      name: json['name'] as String,
      id: json['id'] as String,
      book: json['book'] as String,
      dueDate: DateTime.parse(json['dueDate']) as DateTime,
      submitted: json['submitted'] as bool
    );
  }
}