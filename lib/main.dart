import 'package:flutter/material.dart';
import 'package:movme/core/utils/movie_preference.dart';
import 'package:movme/page/_page.dart';
import 'package:movme/core/utils/user_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await MoviePreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple,
          fontFamily: 'Futura', // TODO: Font
          // textTheme: const TextTheme(
          //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
        ),
        home: MainPage(),
    );
  }
}
