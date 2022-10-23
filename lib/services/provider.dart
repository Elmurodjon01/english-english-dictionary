
import 'package:flutter/material.dart';

class DictProvider extends ChangeNotifier {
  int _i = 0;
  int get initialIndex => _i;
  late  bool _searchActive = false;
  bool get isSearchActive => _searchActive;

  void newIndex({required newI}) {
    _i = newI;
    notifyListeners();
  }
  void searchBrain (bool _new){
    _searchActive = _new;
    notifyListeners();
  }

}
