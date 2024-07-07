import 'package:flutter/material.dart';
import 'package:flutter_application_movies/Widgets/DetailsScreen/custom_grid_view_details_screen.dart';
//import '../Models/MovieModel/movie_model.dart';
import '../MyTheme/my_theme.dart';
import '../Widgets/App Bar/custom_app_bar.dart';
import '../Widgets/DetailsScreen/custom_item_details_screen.dart';
// ignore_for_file: prefer_const_constructors

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'movie details screen';
  const MovieDetailsScreen({
    Key? key,
    //  required this.movieModel
  }) : super(key: key);
 // final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.darkSurfaceColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomItemDetailsScreen(context),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'More Like This',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                height: 300, // Adjust the height to avoid overflow
                child: CustomGridViewDetailsScreen(),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
