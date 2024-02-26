import 'package:flutter/material.dart';
import 'package:intflow_test_task/common/layout/default_layout.dart';
import 'package:intflow_test_task/root_screen/main_screen.dart';

class RootScreen extends StatefulWidget {
  final int? screenIndex ;
  const RootScreen({this.screenIndex,super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  late final TabController controller;
  late int _selectedIndex ;

  @override
  void initState() {
    super.initState();
    _selectedIndex = (widget.screenIndex ?? 1);
    controller = TabController(length: 4, vsync: this);
    controller.animateTo(_selectedIndex);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      _selectedIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: _selectedIndex == 3 ? btmNavItems2 :  btmNavItems,
        selectedItemColor: _selectedIndex == 3 ? const Color(0xFF303030): const Color(0xFF033687),
        unselectedItemColor: const Color(0xFF303030),
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        currentIndex: _selectedIndex != 3 ?_selectedIndex  : 0,
        onTap: (int index) {
print(_selectedIndex);
          controller.animateTo(index);

        },
      ),
      child: TabBarView(
        // physics: const NeverScrollableScrollPhysics(),
        //NeverScrollableScrollPhysics(), // 좌우 스크롤 기능 잠그기
        controller: controller,
        children: _screens,
      ),
    );
  }

  static final List<Widget> _screens = <Widget>[
    // bottom navigation bar 클릭 시 표출 화면

    Container(
      color: Colors.blue,
    ),
    const MainScreen(),
    Container(
      color: Colors.green,
    ),
    Container(color: Colors.purple,),
  ];

  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/icon/active_list_icon.png',
        ),
        icon: Image.asset(
          'assets/icon/list_icon.png',
        ),
        label: "리스트",),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/icon/active_main_icon.png',
        ),
        icon: Image.asset(
          'assets/icon/main_icon.png',
        ),
        label: "메인"),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/icon/active_setting_icon.png',
        ),
        icon: Image.asset(
          'assets/icon/setting_icon.png',
        ),
        label: "설정"),


  ];
  List<BottomNavigationBarItem> btmNavItems2 = [
    BottomNavigationBarItem(
      activeIcon: Image.asset(
        'assets/icon/list_icon.png',
      ),
      icon: Image.asset(
        'assets/icon/list_icon.png',
      ),
      label: "리스트",),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/icon/main_icon.png',
        ),
        icon: Image.asset(
          'assets/icon/main_icon.png',
        ),
        label: "메인"),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/icon/setting_icon.png',
        ),
        icon: Image.asset(
          'assets/icon/setting_icon.png',
        ),
        label: "설정"),


  ];
}
