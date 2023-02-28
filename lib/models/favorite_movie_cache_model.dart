import 'movies_model.dart';

class FavoriteMovie {
  List listFavMovie;

  FavoriteMovie({
    required this.listFavMovie
  });

  void add(String? movieID) {
    listFavMovie.add(movieID!);
  }

  void remove(String? movieID) {
    listFavMovie.remove(movieID!);
  }

  static FavoriteMovie fromJson(Map<String, dynamic> json) => FavoriteMovie(
    listFavMovie: json['listFavMovie'],
  );

  Map<String, dynamic> toJson() => {
    'listFavMovie': listFavMovie,
  };
}