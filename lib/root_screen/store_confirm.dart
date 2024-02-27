import 'package:flutter/material.dart';
import 'package:intflow_test_task/root_screen/rootscreen.dart';
import 'package:lottie/lottie.dart';

class StoreConfirmScreen extends StatefulWidget {
  const StoreConfirmScreen({super.key});

  @override
  State<StoreConfirmScreen> createState() => _StoreConfirmScreenState();
}


class _StoreConfirmScreenState extends State<StoreConfirmScreen> {
  @override
  void initState(){

    dataCheck();

    super.initState();
  }
  void dataCheck() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    // 여기는 data가 들어갓는지 안들어갓는지 check를 해야겟지요 ?

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (_) =>  const RootScreen( screenIndex: 1,)), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
    children: [
    SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Lottie.asset('assets/lottie/confirm_animation.json', width: 200, height: 200)),
    ],
    ),
    // SvgPicture.asset(
    //   'assets/splash/Splash.svg',
    //   width: 3000,
    // ),
    );
  }
}
