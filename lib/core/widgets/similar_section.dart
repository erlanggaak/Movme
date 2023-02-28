import 'package:flutter/material.dart';
import 'package:movme/core/clients/api.dart';
import 'package:movme/core/clients/constant.dart';
import 'package:movme/core/clients/fetch_data_impl.dart';
import 'package:movme/core/sevices/movies_enum.dart';
import 'package:movme/core/widgets/movies_tile.dart';
import 'package:movme/core/clients/client.dart';
import 'package:movme/models/movies_model.dart';

class Similar extends StatefulWidget {
  MovieModel movie;

  Similar({Key? key, required this.movie}) : super(key: key);

  @override
  _SimilarState createState() => _SimilarState();
}

class _SimilarState extends State<Similar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
        future: Client.fetch.getSimilar(widget.movie.id.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data.length == 0) {
              return const Center(child:
                  Text(
                    "Similar movie belum terdaftar",
                    style: TextStyle(
                      fontSize: 16),
                  ), //SizedBox(height: 8),
              );
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 200,
                  ),
                  itemCount: snapshot.data.length < 6 ? snapshot.data.length-1 : 6,
                  itemBuilder: (context, index) {
                    return MoviesTile(movie: snapshot.data[index], showTitle: false,);
                  }
                ),
              );
            }
          }
        },
      )
    );
  }
}

