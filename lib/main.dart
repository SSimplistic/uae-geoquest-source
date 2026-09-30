import "package:emirate_insight/pages/widget_tree.dart";
import "package:flutter/material.dart";

import "data/constants.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AEGeoQuest',
      theme: ThemeData(

        // Main background color is mainColor (coral red)
        // Secondary color is secondaryColor (off-white)
        colorScheme:  ColorScheme(
          primary: Constants.mainColor,
          onPrimary: Constants.secondaryColor,
          secondary: Constants.secondaryColor,
          onSecondary: Constants.mainColor,
          error: Colors.red,
          onError: Colors.white,
          background: Constants.mainColor,
          onBackground: Constants.secondaryColor,
          surface: Constants.secondaryColor,
          onSurface: Constants.mainColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Constants.mainColor,
      ),
      // WidgetTree() connects the various pages
      home: WidgetTree(),
      debugShowCheckedModeBanner: false,
    );
  }
}
