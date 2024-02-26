import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intflow_test_task/root_screen/fab_screen.dart';
import 'package:intflow_test_task/root_screen/rootscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
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
                return FabScreen(); // 올바른 카메라 촬영 방법 class
              });
        },
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color(0xFFFF6861),
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
                    .push(MaterialPageRoute(builder: (_) => RootScreen(screenIndex: 3,)));
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
                  height: _isOrangeContainerVisible
                      ? 200
                      : 0, // 변경된 높이에 따라 애니메이션 적용
                  duration: const Duration(milliseconds: 500), // 애니메이션 지속 시간
                  curve: Curves.easeInOut, // 애니메이션 곡선 설정
                  color: const Color(0x00000000),
                  child: const Center(child: Text("ㅁㅇ")), // 영역 가운데 정렬
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
