import 'package:flutter/material.dart';

class MyTheme {
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor =
      Color(0xff303030); // Darker shade of primary color // Dark background
  static Color darkSurfaceColor = Color(0xff1E1E1E); // Dark surface color
  static Color darkGreyColor = Color(0xffB0B0B0); // Lighter grey for dark theme
  static Color BrownColor = Colors.brown;
  static Color lightWhiteColor = Color.fromARGB(255, 74, 68, 68);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    colorScheme: ColorScheme.dark(
      surface: darkSurfaceColor,
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onBackground: whiteColor,
      onSurface: darkGreyColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkGreyColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: darkGreyColor,
      ),
    ),
  );
}
