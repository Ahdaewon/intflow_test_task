import 'package:flutter/material.dart';
import 'package:intflow_test_task/splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Pretendard"
      ),
      home: const SplashScreen(),
    );
  }
}