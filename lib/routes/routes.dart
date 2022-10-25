

import 'package:eng_eng_dictionary/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/note_screen.dart';
import '../presentation/screens/study_screen.dart';

Map<String, WidgetBuilder> onGenerateRoute = <String, WidgetBuilder>{
  '/': (context) => SplashScreen(),
  '/home': (context) => const HomeScreen(),
  '/study': (context) => const StudyScreen(),
  '/notes': (context) => const NoteScreen(),

};
