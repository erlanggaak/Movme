import 'package:movme/models/cast_model.dart';
import 'package:movme/models/movies_model.dart';

abstract class FetchData {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getUpcoming();
  Future<List<MovieModel>> getTopRated();
  Future<List<MovieModel>> getLatest();
  Future<List<CastModel>> getCast(String id);
}