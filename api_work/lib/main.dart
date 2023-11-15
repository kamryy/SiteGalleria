import 'package:api_work/screens/exam_application_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fontFamily: "Roboto",
          colorScheme: ColorScheme.fromSeed(
              tertiary: const Color.fromARGB(255, 0, 194, 0),
              inversePrimary: const Color.fromARGB(255, 163, 190, 57),
              secondary: const Color.fromARGB(255, 8, 35, 47),
              seedColor: const Color.fromARGB(255, 14, 102, 143))),
      home: ExamsApplicationScreen(),
    );
  }
}
