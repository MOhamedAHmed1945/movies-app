// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_movies/Models/MovieModel/movie_model.dart';
import '../MyTheme/my_theme.dart';
import '../Widgets/App Bar/custom_app_bar.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});
  static const String routeName = 'watch list screen';

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late Future<List<MovieModel>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchAllMovies('https://freetestapi.com/api/v1/movies');
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyTheme.darkSurfaceColor,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<MovieModel>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MovieModel>? movies = snapshot.data;
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: screenWidth / 1.1, // Set the width as required
                      child: Divider(
                        color: Colors.white,
                      ),
                    );
                  },
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: SizedBox(
                          width: 110, // Set the desired width
                          child: Image.asset(
                            movies[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          movies[index].title,
                          style: TextStyle(
                            fontFamily: "League",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movies[index].year.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              movies[index].director,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                        // trailing: Text(movies[index].image),
                        );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
