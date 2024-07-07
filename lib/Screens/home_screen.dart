import 'package:flutter/material.dart';
import '../MyTheme/my_theme.dart';
import '../Widgets/App Bar/custom_app_bar.dart';
import '../Widgets/DetailsScreen/custom_grid_view_details_screen.dart';
import '../Widgets/HomeScreen/custom_item_home_screen.dart';
import '../Widgets/HomeScreen/custom_top _side_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.darkSurfaceColor,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomTopSideHomeScreen(),
                const SizedBox(height: 18),
                Text(
                  'New Release',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: CustomItemHomeScreen(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Recommended',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child:
                      CustomGridViewDetailsScreen(), 
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
