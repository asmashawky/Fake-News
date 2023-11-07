import 'package:flutter/material.dart';
import 'package:untitled2/body.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);
  static const RouteName = 'start';
  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
