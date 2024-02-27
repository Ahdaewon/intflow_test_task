import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intflow_test_task/root_screen/fab_screen.dart';
import 'package:intflow_test_task/root_screen/rootscreen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  bool _isOrangeContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: (){
          showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return const FabScreen(); // 올바른 카메라 촬영 방법 class
              });
        },
        backgroundColor: const Color(0xFFFF6861),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Image.asset(
              'assets/icon/edgefarm_texticon.png',
              width: 103,
              height: 26,
              color: _isOrangeContainerVisible ? Colors.white : null,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const RootScreen(screenIndex: 3,)));
              },
              icon:_isOrangeContainerVisible
                  ? Image.asset(
                'assets/icon/alram_whiteicon.png',
              ) : Image.asset(
                'assets/icon/alramicon.png',
              ),
            ),
            IconButton(
              onPressed: () {

              },
              icon: _isOrangeContainerVisible
                  ? Image.asset(
                'assets/icon/person_whiteicon.png',
              ) : Image.asset(
                'assets/icon/personicon.png',
              ),
            ),
          ],


          flexibleSpace: !_isOrangeContainerVisible
              ? null
              : Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft / 2.4,
                      end: Alignment.bottomRight,
                      colors: const <Color>[
                        Color(0xFF0C4EB8),
                        Color(0xFF033687)
                      ],
                    ),
                  ),
                )),
      body: Container(
        decoration: BoxDecoration(
            gradient: !_isOrangeContainerVisible
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight / 2,
                    colors: const <Color>[
                      Color(0xFF0C4EB8),
                      Color(0xFF033687)
                    ],
                  )),
        child: SafeArea(
          child: GestureDetector(
            onVerticalDragUpdate: (swipe) {
              if (swipe.primaryDelta! > 0) {
                // 아래로 스와이프
                setState(() {
                  _isOrangeContainerVisible = true;
                  print("아래로 스와이프");
                });
              } else if (swipe.primaryDelta! < 0) {
                // 위로 스와이프
                setState(() {
                  _isOrangeContainerVisible = false;
                  print("위로 스와이프");
                });
              }
            },
            child: Column(
              children: [
                AnimatedContainer(
                  height: _isOrangeContainerVisible ? 200 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  color: const Color(0x00000000),
                  child: FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 600)), // 약간의 딜레이
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                  "성오 농자주님",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Row(
                                  children: [
                                    Text("반갑습니다" , style :  TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ) ),
                                    Image.asset(
                                      'assets/main_content_icon/hand_icon.png', width: 32, height: 32,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/main_content_icon/temp_icon.png',
                                    ),
                                    SizedBox(width: 10,),
                                    Text("27℃" ,style: TextStyle(fontSize: 14, color: Colors.white ),)
                                  ],
                                ), Image.asset(
                                  'assets/main_content_icon/seperate_icon.png',
                                ),Row(
                                  children: [
                                    Image.asset(
                                      'assets/main_content_icon/rain_icon.png',
                                    ),
                                    SizedBox(width: 10,),
                                    Text("87%" ,style: TextStyle(fontSize: 14, color: Colors.white ),)
                                  ],
                                ),
                                Image.asset(
                                  'assets/main_content_icon/seperate_icon.png',
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/main_content_icon/co2_icon.png',
                                    ),
                                    SizedBox(width: 10,),
                                    Text("500ppm" ,style: TextStyle(fontSize: 14, color: Colors.white ),)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        // 딜레이 중에 보여줄 로딩 등의 위젯
                        return Container(
                            width: 10, height: 10,
                            child: CircularProgressIndicator()); // 예시로 로딩 인디케이터
                      }
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
