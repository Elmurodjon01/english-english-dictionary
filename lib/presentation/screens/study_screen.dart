import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudyScreen extends StatelessWidget {
  static const String pageid = 'studyScreen';
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
            child: Text('study screen'),
          )),
    );
  }
}
