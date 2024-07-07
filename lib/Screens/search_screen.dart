import 'package:flutter/material.dart';
import 'package:flutter_application_movies/MyTheme/my_theme.dart';

import '../Widgets/App Bar/custom_app_bar.dart';
import '../Widgets/SearchScreen/custom_search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String routeName = 'search screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.darkSurfaceColor,
      appBar: const CustomAppBar(),
      body: CustomSearchItem(),
    );
  }
}



