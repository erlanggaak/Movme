part of '_page.dart';

class MovieDetailPage extends StatefulWidget {
  //String movieID;
  MovieModel movie;

  MovieDetailPage({
    Key? key,
    //required this.movieID
    required this.movie,
  }) : super(key: key);

  @override
  _MovieDetailPage createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    '${Constants.BASE_IMAGE_URL}/${widget.movie.backdropPath}',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 25,
                      icon: const Icon(Icons.close)
                    )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Text(
                  widget.movie.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (widget.movie.adult)
                       Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.white30,
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "18+",
                              style: TextStyle(
                                fontSize: 10,
                                //backgroundColor: Colors.white12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.movie.releaseDate.year.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.movie.overview,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4),
                child: Text(
                  "Cast: Awesome Person 1, Awesome Person 2, more...", //TODO: Cast
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white60
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              // TODO: more like this
            ]
          ),
        ),
      ),
    );
  }

}