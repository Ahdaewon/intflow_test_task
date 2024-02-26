import 'package:flutter/material.dart';
import 'package:intflow_test_task/common/layout/default_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Center(child: Text("data")));
  }
}
