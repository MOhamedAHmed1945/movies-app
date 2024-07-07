import 'package:flutter/material.dart';

import '../../Models/MovieModel/movie_model.dart';
import '../../Screens/movie_details_screen.dart';

class CustomItemHomeScreen extends StatefulWidget {
  const CustomItemHomeScreen({super.key});

  @override
  State<CustomItemHomeScreen> createState() => _CustomItemHomeScreenState();
}

class _CustomItemHomeScreenState extends State<CustomItemHomeScreen> {
  late Future<List<MovieModel>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchAllMovies('https://freetestapi.com/api/v1/movies?limit=5');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.4;
    return FutureBuilder<List<MovieModel>>(
      future: futureMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MovieModel>? movies = snapshot.data;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailsScreen.routeName,
              );
            },
            child: SizedBox(
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: imageWidth,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            movies![index].image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 15,
                          child: Text(
                            movies[index].title,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Add'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              backgroundColor: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
