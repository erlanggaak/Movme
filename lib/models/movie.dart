class MovieEntity {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final DateTime releaseDate;
  final String overview;

  const MovieEntity({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
  });
}