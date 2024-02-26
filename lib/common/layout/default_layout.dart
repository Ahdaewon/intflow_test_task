import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  const DefaultLayout({
    this.bottomNavigationBar,
    this.backgroundColor,
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: backgroundColor ?? Colors.white,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
