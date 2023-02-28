import 'dart:convert';
import 'package:movme/models/favorite_movie_cache_model.dart';
import 'package:movme/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movme/models/user_model.dart';

class MoviePreference {
  static late SharedPreferences _preferences;

  static const _key = 'favorite';
  static var defaultList = FavoriteMovie(
    listFavMovie: <MovieModel>[],
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setFavorite(FavoriteMovie favorite) async {
    final json = jsonEncode(favorite.toJson());

    await _preferences.setString(_key, json);
  }

  static FavoriteMovie getFavorite() {
    final json = _preferences.getString(_key);

    return json == null ? defaultList : FavoriteMovie.fromJson(jsonDecode(json));
  }
}