// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';

import '../../Models/MovieModel/movie_model.dart';

class CustomSearchItem extends StatefulWidget {
  @override
  _CustomSearchItemState createState() => _CustomSearchItemState();
}

class _CustomSearchItemState extends State<CustomSearchItem> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<MovieModel>> futureMovies;
  List<MovieModel> _allItems = [];
  List<MovieModel> _searchResults = [];

  @override
  void initState() {
    super.initState();
    futureMovies = fetchAllMovies('https://freetestapi.com/api/v1/movies');
    futureMovies.then((movies) {
      setState(() {
        _allItems = movies;
      });
    });
  }

  void _searchItems(String query) {
    final results = _allItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search items',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {
                    _searchResults = [];
                  });
                },
              ),
            ),
            onChanged: _searchItems,
          ),
        ),
        Expanded(
          child: FutureBuilder<List<MovieModel>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No movies found'));
              } else {
                return ListView.builder(
                  itemCount: _searchResults.isEmpty
                      ? _allItems.length
                      : _searchResults.length,
                  itemBuilder: (context, index) {
                    final item = _searchResults.isEmpty
                        ? _allItems[index]
                        : _searchResults[index];
                    return ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
