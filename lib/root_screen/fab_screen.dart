import 'package:flutter/material.dart';
import 'package:intflow_test_task/root_screen/rootscreen.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "문의하기",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => RootScreen(
                            screenIndex: 3,
                          )));
                },
                child: Image.asset(
                  'assets/icon/alram_icon_fab.png',
                ),
                backgroundColor: Color(0xFFFF6861),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "문의하기",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/icon/report_icon_fab.png',
                ),
                backgroundColor: Color(0xFFFF6861),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "공유하기",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {},
                child: Image.asset(
                  'assets/icon/share_icon_fab.png',
                ),
                backgroundColor: Color(0xFFFF6861),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/icon/close_icon_Fab.png',
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 56,
          )
        ],
      ),
      backgroundColor: Color(0xCC000000),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
      ),
    );
  }
}
