import 'package:movme/models/movies_model.dart';
import 'constant.dart';
import '../sevices/movies_enum.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:async/';

Future<List<MovieModel>> fetchMovies(FetchType fetchType) async {
  var url = Uri.parse("${Constants.BASE_URL}/movie/${fetchType.type}?api_key=${Constants.API_KEY}");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<MovieModel> listMovies = [];
  for (var d in data["results"]) {
    if (d != null) {
      listMovies.add(MovieModel.fromJson(d));
    }
  }
  return listMovies;
}