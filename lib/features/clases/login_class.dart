import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic> userInformation = {
    'stayLogin': false,
    'isLogin': false,
    'email': '',
  };
   
  bool get stayLogin => userInformation['stayLogin']; 
  bool get isLogin => userInformation['isLogin'];
  String get email => userInformation['email'];

  void setstayLogin(bool value) {
    userInformation['stayLogin'] = value;
    notifyListeners();
  }

  void setIsLogin(bool value) {
    userInformation['isLogin'] = value;
    notifyListeners();
  }

  void setEmail(var email) {
    userInformation['email'] = email;
    notifyListeners();
  }
}