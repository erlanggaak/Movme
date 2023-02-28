import 'package:flutter/material.dart';
import 'package:movme/core/clients/constant.dart';
import 'package:movme/core/sevices/date_formatter.dart';
import 'package:movme/models/movies_model.dart';
import 'package:movme/models/cast_model.dart';
import 'package:movme/page/_page.dart';

class MoviesTile extends StatefulWidget {
  MovieModel movie;
  bool showTitle;

  MoviesTile({
    Key? key,
    required this.movie,
    this.showTitle = true
  }) : super(key: key);

  @override
  _MoviesTileState createState() => _MoviesTileState();
}

class _MoviesTileState extends State<MoviesTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
              MovieDetailPage(
                movie: widget.movie,
              )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: widget.movie.posterPath == null ? Image.asset('lib/assets/static/images/placeholder.png')
                : Image.network(
                '${Constants.BASE_IMAGE_URL}/${widget.movie.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
            if (widget.showTitle)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        text: widget.movie.title.length > 18 ? '${widget.movie.title.substring(0, 17)}...' : widget.movie.title,),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, bottom: 2.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0
                        ),
                        text: DateFormatter.parse(widget.movie.releaseDate),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }

}

