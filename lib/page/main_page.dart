part of '_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainPageAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: 320,
                child: Trending()
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: 320,
                child: TopRated()
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: 320,
                child: Upcoming()
              ),
            ]
          ),
        ),
      ),
    );
  }
}