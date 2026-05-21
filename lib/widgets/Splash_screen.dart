
import 'package:flutter/material.dart';
import 'dart:async';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/list');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromARGB(255, 247, 67, 67),Color.fromARGB(197, 79, 174, 182)],
        begin: Alignment.topCenter,
        end:Alignment.bottomCenter)
      ),

      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Padding(padding: EdgeInsets.all(10),child: Text("V : 1.0"),)],
          ),
          SizedBox(height: 150,),
          Image.asset('images/logo.png',width: 200,height: 200,),
          Text("Digital Library",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),
          SizedBox(height: 50,),
          CircularProgressIndicator(color: Colors.white,strokeWidth: 5,),
          SizedBox(height: 5,),
          Text("Loading ...",style: TextStyle(fontSize: 20,color: Colors.black),),
          Spacer(),
          Text("© 2026 Library Management",style: TextStyle(color: Colors.black),)
        ],
      ),
    ),);
  }
}