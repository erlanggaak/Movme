import 'package:movme/core/clients/client.dart';
import 'package:movme/models/movies_model.dart';

enum FetchType {
  popular,
  latest,
  nowPlaying,
  topRated,
  upcoming,
  trending
}

extension FetchTypeExtension on FetchType {
  Function get type {
    switch (this) {
      case FetchType.popular:
        return Client.fetch.getPopular;
      case FetchType.latest:
        return Client.fetch.getLatest; // TODO: implement latest
      case FetchType.nowPlaying:
        return Client.fetch.getNowPlaying;
      case FetchType.topRated:
        return Client.fetch.getTopRated;
      case FetchType.upcoming:
        return Client.fetch.getUpcoming;
      case FetchType.trending:
        return Client.fetch.getTrending;
    }
  }

  String get name {
    switch (this) {
      case FetchType.popular:
        return "Popular";
      case FetchType.latest:
        return "Latest";
      case FetchType.nowPlaying:
        return "Now Playing";
      case FetchType.topRated:
        return "Top Rated";
      case FetchType.upcoming:
        return "Upcoming";
      case FetchType.trending:
        return "Trending";
      default:
        return "";
    }
  }
}
