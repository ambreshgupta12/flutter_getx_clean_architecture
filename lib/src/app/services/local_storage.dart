import 'dart:convert';

import 'package:flutter_clean_architecture/src/domain/entities/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
}

class LocalStorage extends GetxService {
   SharedPreferences? _preferences;
  Future<LocalStorage> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  User? get user {
    final rowData = _preferences?.getString(_Key.user.toString());
    if (rowData == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rowData);
    return User.fromJson(map);
  }

  set user(User? user) {
    if (user != null) {
      _preferences!.setString(_Key.user.toString(), json.encode(user));
    } else {
      _preferences!.remove(_Key.user.toString());
    }
  }
}
