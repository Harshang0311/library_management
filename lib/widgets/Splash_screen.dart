
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromARGB(255, 255, 255, 255),Color.fromARGB(197, 79, 174, 182)],
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
    );
  }
}