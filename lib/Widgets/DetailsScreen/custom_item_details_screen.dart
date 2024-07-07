// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../MyTheme/my_theme.dart';

class CustomItemDetailsScreen extends StatefulWidget {
  const CustomItemDetailsScreen(
    BuildContext context, {
    Key? key,
  //  required this.movieModel,
  }) : super(key: key);
 // final MovieModel movieModel;
  @override
  State<CustomItemDetailsScreen> createState() =>
      _CustomItemDetailsScreenState();
}

class _CustomItemDetailsScreenState extends State<CustomItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
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
                        image: DecorationImage(
                          image: AssetImage(
                         //   widget.movieModel.image,
                            'assets/Images/HD-wallpaper-fast-furious-6-rock-actors-movies-vin-diesel-paul.jpg'
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                       '22/05/2024',
                      //widget.movieModel.year as String,
                      style: TextStyle(
                        fontFamily: "Times",
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                     // widget.movieModel.title,
                      'Fast and Furious',
                      style: TextStyle(
                        fontFamily: "League",
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'franchise is a series of action films centered on illegal street racing, heists, and espionage, featuring characters like Dominic Toretto and Brian O Conner. Known for its high-octane stunts and themes of family and loyalty.',
                     // widget.movieModel.plot,
                      style: TextStyle(
                        fontFamily: "League",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '2h 59m',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                        ),
                        Text(
                          '7.7',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
