import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intflow_test_task/root_screen/rootscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){

    dataCheck();

    super.initState();
  }

  void dataCheck() async {
    await Future.delayed(const Duration(seconds: 2));
    // delay 대신에 데이터를 가져오는 기능을 해야겠지요?? 예를 들면 로그인 데어터를 가져온다던가 등등....

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (_) =>  const RootScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
            'assets/splash/Splash.png',
            fit: BoxFit.cover,
          )),
        ],
      ),
      // SvgPicture.asset(
      //   'assets/splash/Splash.svg',
      //   width: 3000,
      // ),
    );
  }
}
