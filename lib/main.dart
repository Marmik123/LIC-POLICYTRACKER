import 'package:flutter/material.dart';
import 'package:lic_policies_clone/view/policies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIC APP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Policies(),
    );
  }
}


