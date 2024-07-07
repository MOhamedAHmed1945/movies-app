// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Models/MovieModel/movie_model.dart';
import '../../MyTheme/my_theme.dart';

class CustomTopSideHomeScreen extends StatefulWidget {
  const CustomTopSideHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTopSideHomeScreen> createState() =>
      _CustomTopSideHomeScreenState();
}

class _CustomTopSideHomeScreenState extends State<CustomTopSideHomeScreen> {
  late Future<List<MovieModel>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies =
        fetchAllMovies('https://freetestapi.com/api/v1/movies?limit=2');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FutureBuilder<List<MovieModel>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieModel>? movies = snapshot.data;
            if (movies != null && movies.isNotEmpty) {
              MovieModel movie = movies[1];
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Card(
                  color: MyTheme.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 203,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            movie.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontFamily: "League",
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              movie.year.toString(),
                              style: TextStyle(
                                fontFamily: "Times",
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${movie.runtime} M',
                              style: TextStyle(
                                fontFamily: "Times",
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text("No movies found"));
            }
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
