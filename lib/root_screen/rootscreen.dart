import 'package:flutter/material.dart';
import 'package:intflow_test_task/common/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Center(child: Text('ROOTSCREEN')));
  }
}
