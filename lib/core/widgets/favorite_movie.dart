import 'package:flutter/material.dart';
import 'package:movme/core/clients/client.dart';
import 'package:movme/core/clients/constant.dart';
import 'package:movme/core/sevices/date_formatter.dart';
import 'package:movme/core/widgets/movies_tile.dart';
import 'package:movme/models/movies_model.dart';
import 'package:movme/models/cast_model.dart';
import 'package:movme/page/_page.dart';

class FavoriteMovieTile extends StatefulWidget {
  String movieID;

  FavoriteMovieTile({
    Key? key,
    required this.movieID,
  }) : super(key: key);

  @override
  _FavoriteMovieTileState createState() => _FavoriteMovieTileState();
}

class _FavoriteMovieTileState extends State<FavoriteMovieTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Client.fetch.getMovie(widget.movieID),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MoviesTile(
            movie: snapshot.data);
        }
      });
  }

}

