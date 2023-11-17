import 'package:api_work/repo/exam_application_repositories.dart';
import 'package:api_work/screens/exam_application_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main(List<String> args) {
  final httpLink = HttpLink("https://mycollegeindia.as.r.appspot.com//");

  ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httpLink));
  ExamRepositories examRepositories = ExamRepositories(client: client.value);
  runApp(App(
    examRepositories: examRepositories,
  ));
}

class App extends StatelessWidget {
  App({super.key, required this.examRepositories});
  ExamRepositories examRepositories;

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
      home: ExamsApplicationScreen(
        examRepositories: examRepositories,
      ),
    );
  }
}
