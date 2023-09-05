import 'package:flutter/material.dart';

import 'SettingProvider.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '',
      _cartCount = '',
      _curBal = '',
      _mob = '',
      _profilePic = '',
      _email = '';
  String? _userId = '';

  String? _curPincode = '';

  late SettingProvider settingsProvider;

  String get curUserName => settingsProvider.userName ?? _userName;

  String get curPincode => _curPincode ?? '';

  String get curCartCount => _cartCount;

  String get curBalance => _curBal;

  String get mob => _mob;

  String get profilePic => settingsProvider.profileUrl ?? _profilePic;

  String? get userId => settingsProvider.userId ?? _userId;

  String get email => settingsProvider.email ?? _email;

  void setPincode(String pin) {
    _curPincode = pin;
    notifyListeners();
  }

  void setCartCount(String count) {
    _cartCount = count;
    notifyListeners();
  }

  void setBalance(String bal) {
    _curBal = bal;
    notifyListeners();
  }

  void setName(String count) {
    //settingsProvider.userName=count;
    _userName = count;
    notifyListeners();
  }

  void setMobile(String count) {
    _mob = count;
    notifyListeners();
  }

  void setProfilePic(String count) {
    _profilePic = count;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setUserId(String? count) {
    _userId = count;
  }
}
