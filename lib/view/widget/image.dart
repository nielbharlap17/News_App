import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Network Image Example'),
        ),
        body: Center(
          child: Image.network(
            "https://imgd.aeplcdn.com/310x174/n/cw/ec/144851/exter-exterior-right-front-three-quarter-21.jpeg?isig=0&q=75", // Replace with your image URL
            width: 100, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            fit: BoxFit.cover, // Adjust the fit option as needed
          ),
        ),
      ),
    );
  }
}
