import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eng_eng_dictionary/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Icons.menu_book_outlined,
            nextScreen:const HomeScreen(),
            splashTransition: SplashTransition.sizeTransition,
            backgroundColor: Colors.white));
    //const Color.fromARGB(255, 9, 1, 41),
    //TODO this color should be applied as main background color of splash screen.
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}