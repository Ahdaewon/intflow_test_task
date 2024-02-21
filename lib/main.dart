import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Pretendard"
      ),
      home: const Scaffold(
        body: Center(
          child: Text("폰트설정",style: TextStyle(fontWeight: FontWeight.w900),),
        ),
      ),
    );
  }
}