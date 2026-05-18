
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
        gradient: LinearGradient(colors: [Color.fromARGB(255, 82, 154, 226),Color.fromARGB(198, 139, 139, 139)],
        begin: Alignment.topCenter,
        end:Alignment.bottomCenter)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Version : 1.0",style: TextStyle(fontSize: 20),)],
          ),
          SizedBox(height: 50,),
          Image.asset('images/logo.png',width: 200,height: 200,),
          Text("Library Management",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),
          SizedBox(height: 50,),
          CircularProgressIndicator(color: Colors.white,strokeWidth: 5,),
          SizedBox(height: 5,),
          Text("Loading ...",style: TextStyle(fontSize: 20,color: Colors.black),),
          SizedBox(height: 150,),
          Text("© 2026 Library Management",style: TextStyle(color: Colors.black),)
        ],
      ),
    );
  }
}