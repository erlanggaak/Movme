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
    final favoriteList = MoviePreference.getFavorite();
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
                  widget.movie.backdropPath == null
                    ? Image.asset('lib/assets/static/images/placeholder.png')
                    : Image.network(
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
                  Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          if (!favoriteList.listFavMovie.contains(widget.movie.id.toString())) {
                            favoriteList.add(widget.movie.id.toString());
                          } else {
                            favoriteList.remove(widget.movie.id.toString());
                          }
                          MoviePreference.setFavorite(favoriteList);
                          setState(() {});
                        },
                        iconSize: 25,
                        color: favoriteList.listFavMovie.contains(widget.movie.id.toString())
                          ? Colors.pink : Colors.white,
                        icon: Icon(Icons.favorite)
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 14),
                child: Text(
                  widget.movie.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 4),
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
                padding: const EdgeInsets.only(top: 8.0, left: 14.0, right: 14.0, bottom: 12),
                child: Text(
                  widget.movie.overview,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 4),
                child: Text(
                  "Cast: Awesome Person 1, Awesome Person 2, more...", //TODO: Cast
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white60
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, left: 18),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 4.0, color: Colors.deepPurple),
                  ),
                ),
                child: Text("More like this",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Similar(movie: widget.movie,),
              )
            ]
          ),
        ),
      ),
    );
  }

}