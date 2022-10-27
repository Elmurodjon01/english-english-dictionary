import 'dart:io';

import 'package:eng_eng_dictionary/constants/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/dict_model.dart';

class DictService extends ChangeNotifier {
  Future<List<DictModel>> searchWord({String? word}) async {
    final url = "$httpAdress/$word";
    try {
      final response = await http.get(Uri.parse(url));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);

        final dictionaryModel = dictionaryModelFromJson(response.body);
        return dictionaryModel;
      } else {
        print(response.body);
        final dictionaryModel = dictionaryModelFromJson(response.body);

        return dictionaryModel;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something went wrong');
    }
  }

  @override
  void notifyListeners() {
    searchWord();
    super.notifyListeners();
  }
}
