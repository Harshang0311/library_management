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
}