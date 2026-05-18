import 'package:flutter/material.dart';
import 'package:library_management/widgets/MyWidget.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    )
  );
}