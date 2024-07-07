// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_movies/Screens/browse_screen.dart';
import 'package:flutter_application_movies/Screens/home_screen.dart';
import 'package:flutter_application_movies/Screens/search_screen.dart';
import 'package:flutter_application_movies/Screens/watch_list_screen.dart';
import '../MyTheme/my_theme.dart';

class HomeNavBarScreen extends StatefulWidget {
  const HomeNavBarScreen({Key? key}) : super(key: key);
  static const String homeScreenRoute = 'home nav bar screen';
  @override
  State<HomeNavBarScreen> createState() => _HomeNavBarScreenState();
}

class _HomeNavBarScreenState extends State<HomeNavBarScreen> {
  var currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.darkSurfaceColor,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyTheme.BrownColor,
        fixedColor: MyTheme.whiteColor,
        elevation: 2.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.branding_watermark_outlined,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: 'Watch List',
          ),
        ],
      ),
    );
  }
}
