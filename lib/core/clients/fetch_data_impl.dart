import 'package:movme/core/clients/fetch_data.dart';
import 'package:movme/models/cast_model.dart';
import 'package:movme/models/movies_model.dart';
import 'constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchDataImpl extends FetchData {

  @override
  Future<List<MovieModel>> getTrending() async {
    var url = Uri.parse("${Constants.BASE_URL}/trending/movie/day?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<MovieModel>> getPopular() async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/popular?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<MovieModel>> getUpcoming() async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/upcoming?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/now_playing?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<MovieModel>> getTopRated() async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/top_rated?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<MovieModel>> getLatest() async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/latest?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
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

  @override
  Future<List<CastModel>> getCast(String id) async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/${id}/credits?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<CastModel> listCast = [];
    for (var d in data["cast"]) {
      if (d != null) {
        listCast.add(CastModel.fromJson(d));
      }
    }
    return listCast;
  }

  @override
  Future<MovieModel> getMovie(String id) async {
    var url = Uri.parse("${Constants.BASE_URL}/movie/${id}?api_key=${Constants.API_KEY}");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    MovieModel movie = MovieModel.fromJson(data);

    return movie;
  }
}