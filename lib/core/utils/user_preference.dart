import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movme/models/user_model.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const defaultUser = User(
      imagePath: "",
      name: "user",
      jurusan: "Computer Science",
      angkatan: 2021,
      email: "-",
      instagram: "-",
      about: "-",
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? defaultUser : User.fromJson(jsonDecode(json));
  }
}