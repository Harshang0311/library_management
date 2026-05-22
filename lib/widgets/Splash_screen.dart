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
      Navigator.pushReplacementNamed(context, '/list');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfff2f6ff),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),

      child:Column(
        children: [

          // VERSION
          Align(
            alignment: Alignment.topRight,

            child: Padding(
              padding: const EdgeInsets.all(40),

              child: Text(
                "V : 1.0",

                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 150),

          // LOGO
          Image.asset(
            'images/logo.png',
            width: 200,
            height: 200,
          ),

          // TITLE
          const Text(
            "LibraTrack",

            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 50),

          // LOADING
          const CircularProgressIndicator(
            color: Colors.blue,
          ),

          const SizedBox(height: 10),

          const Text(
            "Loading...",
            style: TextStyle(fontSize: 20),
          ),

          const Spacer(),

          // COPYRIGHT
          const Padding(
            padding: EdgeInsets.only(bottom: 50),

            child: Text(
              "© 2026 LibraTrack",
            ),
          ),
        ],
      ),
    ),);
  }
}