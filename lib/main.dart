import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 23,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )),
      home: const HomePage(),
    );
  }
}
