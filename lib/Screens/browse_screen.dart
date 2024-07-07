// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../MyTheme/my_theme.dart';
import '../Widgets/App Bar/custom_app_bar.dart';
import '../Widgets/BrowseScreen/custom_grid_view_browse_screen.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});
  static const String routeName = 'browse screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.darkSurfaceColor,
      appBar: CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Browse Category',
                  style: TextStyle(
                    fontFamily: "League",
                    fontSize: 20.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: CustomGridViewBrowseScreen()),
            ),
          ],
        ),
      )),
    );
  }
}
