// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace
import 'package:flutter/material.dart';

import '../../Models/MovieModel/movie_model.dart';
import '../../Screens/movie_details_screen.dart';

class CustomGridViewDetailsScreen extends StatefulWidget {
  const CustomGridViewDetailsScreen({super.key});

  @override
  State<CustomGridViewDetailsScreen> createState() =>
      _CustomGridViewDetailsScreenState();
}

class _CustomGridViewDetailsScreenState
    extends State<CustomGridViewDetailsScreen> {
  late Future<List<MovieModel>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchAllMovies(
        'https://freetestapi.com/api/v1/movies?sort=name&order=dec');
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
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 6.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: imageWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/Images/fandf.jpg',
                                width: 250,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Add'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  backgroundColor:
                                      Colors.black.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5), // Spacing between image and text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          //'Movie Title $index',
                          movies![index].title, maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            movies[index].rating.toString(),
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              movies[index].year.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          Text(
                            '${movies[index].runtime.toString()} M',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
