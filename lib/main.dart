import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/movies_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crud',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      home: MoviesPage(),
    );
  }
}
