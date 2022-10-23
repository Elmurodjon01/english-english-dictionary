
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertMessage {
  onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Dictionary",
      desc: "This app helps you to understand the meaning of English words!",
    ).show();
  }

}