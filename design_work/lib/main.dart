import 'package:design_work/screens/college_description.dart';
import 'package:design_work/screens/home_screen.dart';
import 'package:design_work/screens/loading_screen.dart';
import 'package:design_work/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: "Inter",
          colorScheme: ColorScheme.fromSeed(
              tertiary: const Color.fromARGB(255, 0, 194, 0),
              inversePrimary: const Color.fromARGB(255, 207, 255, 13),
              secondary: const Color.fromARGB(255, 8, 35, 47),
              seedColor: const Color.fromARGB(255, 14, 102, 143))),
      home: const CollegeDescriptionScreen(),
    );
  }
}
