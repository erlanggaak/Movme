part of '_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = MoviePreference.getFavorite().listFavMovie;
    return SafeArea(
      child: Scaffold(
        appBar: FavoriteAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 350,
              ),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                // return Text(favoriteList[index].title);
                return FavoriteMovieTile(movieID: favoriteList[index],);
              }
            ),
          ),
        ),
      ),
    );
  }

}