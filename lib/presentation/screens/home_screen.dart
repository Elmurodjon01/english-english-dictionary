
import 'package:eng_eng_dictionary/presentation/screens/study_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../services/provider.dart';
import '../../widgets /drawer.dart';
import '../../widgets /search_box.dart';
import '../../widgets /search_view.dart';
import 'note_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String pageid = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List pages = const [
    SearchCard(),
    StudyScreen(),
    NoteScreen(),
  ];
  DictProvider provider = DictProvider();
  SearchView _searchView = SearchView();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DictProvider>(context);
    return Consumer(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(
            iconTheme: const IconThemeData(
              size: 30,
              color: Color.fromARGB(255, 9, 1, 41),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                 Share.share('https://play.google.com/store/apps/details?id=com.FDGEntertainment.redball4.gp');
                },
                icon: const Icon(
                  Icons.share_rounded,
                ),
              ),
            ],
          ),
          drawer: const Drawer(
            //backgroundColor: Color.fromARGB(255, 9, 1, 41),
            child: DrawerItem(),
          ),
          body: pages[provider.initialIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            onTap: (newIn) => provider.newIndex(newI: newIn),
            currentIndex: provider.initialIndex,
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 9, 1, 41),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.house_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Study',
                icon: Icon(
                  Icons.book_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'notes',
                icon: Icon(
                  Icons.note_add,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
