import 'package:flutter/material.dart';
import 'package:intflow_test_task/common/layout/default_layout.dart';

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
      appBar: AppBar(
        backgroundColor:
            _isOrangeContainerVisible ? Colors.blue : Colors.yellow,
        title: Text("우선 테스트여"),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            // 아래로 스와이프
            setState(() {
              _isOrangeContainerVisible = true;
              print("아래로 스와이프");
            });
          } else if (details.primaryDelta! < 0) {
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
              height:
                  _isOrangeContainerVisible ? 300 : 0, // 변경된 높이에 따라 애니메이션 적용
              duration: Duration(milliseconds: 500), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선 설정
              color: Colors.orange,
              child: Center(child: Text("ㅁㅇ")), // 영역 가운데 정렬
            ),
            Expanded(
                child: Container(
              color: Colors.blue,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.purple,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
