

import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/note_screen.dart';
import '../presentation/screens/study_screen.dart';

Map<String, WidgetBuilder> onGenerateRoute = <String, WidgetBuilder>{
  '/': (context) => const HomeScreen(),
  '/study': (context) => const StudyScreen(),
  '/notes': (context) => const NoteScreen(),
};
