import 'package:flutter/material.dart';

import '../../MyTheme/my_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Movies'),
      backgroundColor: MyTheme.darkSurfaceColor,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
