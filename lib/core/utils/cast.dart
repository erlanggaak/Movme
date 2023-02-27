import 'package:movme/core/clients/client.dart';
import 'package:movme/models/cast_model.dart';
import 'package:movme/models/movies_model.dart';

class CastGetter {
  String movieID;
  List<CastModel> castList = [];

  CastGetter(this.movieID);

  Future<String> getCastNameString() async {
    var casts =  await Client.fetch.getCast(movieID);
    String container = "";
    int counter = 0;
    for (var cast in casts){
      castList.add(cast);
      container += "${cast.name}, ";
      counter++;
      if (counter == 10) {
        break;
      }
    }
    return container;
  }

  List<CastModel> get getCast {
    return castList;
  }
}