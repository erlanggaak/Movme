import 'package:flutter/material.dart';
import 'package:movme/core/clients/api.dart';
import 'package:movme/core/clients/constant.dart';
import 'package:movme/core/clients/fetch_data_impl.dart';
import 'package:movme/core/sevices/movies_enum.dart';
import 'package:movme/core/widgets/movies_tile.dart';
import 'package:movme/core/clients/client.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Now Playing",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: Client.fetch.getNowPlaying(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Movie tidak tersedia",
                          style: TextStyle(
                              color: Color(0xff59A5D8),
                              fontSize: 20),
                        ), //SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return MoviesTile(
                            movie: snapshot.data[index],
                          );
                        },
                      ),
                    );
                  }
                }
              },
            )
            // MoviesTile(
            //   imgUrl: "9Rj8l6gElLpRL7Kj17iZhrT5Zuw.jpg",
            //   title: "Santana",
            //   releaseDate: DateTime.now(),
            // )
          ]
      ),
    );
  }
}

