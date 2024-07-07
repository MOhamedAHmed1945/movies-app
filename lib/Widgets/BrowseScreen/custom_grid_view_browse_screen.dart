// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../../Models/MovieCategoriesModel/movie_categories_model.dart';

class CustomGridViewBrowseScreen extends StatefulWidget {
  const CustomGridViewBrowseScreen({super.key});

  @override
  State<CustomGridViewBrowseScreen> createState() => _CustomGridViewBrowseScreenState();
}

class _CustomGridViewBrowseScreenState extends State<CustomGridViewBrowseScreen> {
  @override
  Widget build(BuildContext context) {
    final movieCategoriesList = MovieCategoriesModel.movieCategoriesList;

    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
      ),
      itemCount: movieCategoriesList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  movieCategoriesList[index].imageCategory,
                  width: 250,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 45,
                right: 50,
                child: Text(
                  movieCategoriesList[index].titleCategory,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
