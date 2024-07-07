// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_movies/Models/ProviderModels/theme_provider.dart';
import 'package:flutter_application_movies/Screens/browse_screen.dart';
import 'package:flutter_application_movies/Screens/home_screen.dart';
import 'package:flutter_application_movies/Screens/movie_details_screen.dart';
// import 'package:flutter_application_movies/Screens/movie_details_screen.dart';
import 'package:flutter_application_movies/Screens/search_screen.dart';
import 'package:flutter_application_movies/Screens/watch_list_screen.dart';
import 'package:provider/provider.dart';
import 'MyTheme/my_theme.dart';
import 'Screens/home_nav_bar_screen.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeNavBarScreen.homeScreenRoute,
      darkTheme: MyTheme.darkTheme,
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HomeNavBarScreen.homeScreenRoute: (context) => HomeNavBarScreen(),
        BrowseScreen.routeName: (context) => BrowseScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        WatchListScreen.routeName: (context) => WatchListScreen(),
         MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
      },
    );
  }
}
