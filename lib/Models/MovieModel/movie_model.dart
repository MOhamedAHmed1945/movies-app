
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieModel {
  final int id;
  final String title;
  final int year;
  final List<String> genre;
  final String rating;
  final String director;
  final List<String> actors;
  final String plot;
  final String poster;
  final String trailer;
  final int runtime;
  final String awards;
  final String country;
  final String language;
  final String boxOffice;
  final String production;
  final String website;
  final String image;

  MovieModel({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    this.rating = '3.9',
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
    this.image =
        'assets/Images/HD-wallpaper-fast-furious-6-rock-actors-movies-vin-diesel-paul.jpg',
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genre: List<String>.from(json['genre']),
      //rating: json['rating'],
      director: json['director'],
      actors: List<String>.from(json['actors']),
      plot: json['plot'],
      poster: json['poster'],
      trailer: json['trailer'],
      runtime: json['runtime'],
      awards: json['awards'],
      country: json['country'],
      language: json['language'],
      boxOffice: json['boxOffice'],
      production: json['production'],
      website: json['website'],
      image: json['image'] ??
          'assets/Images/HD-wallpaper-fast-furious-6-rock-actors-movies-vin-diesel-paul.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genre': genre,
      'rating': rating,
      'director': director,
      'actors': actors,
      'plot': plot,
      'poster': poster,
      'trailer': trailer,
      'runtime': runtime,
      'awards': awards,
      'country': country,
      'language': language,
      'boxOffice': boxOffice,
      'production': production,
      'website': website,
      'image': image,
    };
  }
}

Future<List<MovieModel>> fetchAllMovies(String apiLink) async {
  final response = await http.get(Uri.parse(apiLink));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((movie) => MovieModel.fromJson(movie)).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}
