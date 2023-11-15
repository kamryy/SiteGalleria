import 'package:design_work/widgets/home_screen/QnA_section.dart';
import 'package:design_work/widgets/home_screen/quick_links_section.dart';
import 'package:design_work/widgets/home_screen/search_bar.dart';
import 'package:design_work/widgets/home_screen/top_universities_section.dart';
import 'package:design_work/widgets/home_screen/videos_section.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.75),
                      Theme.of(context).colorScheme.primary,
                    ]),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 32,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        const Text(
                          "My Kollege",
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.notifications_none,
                          size: 32,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const Spacer(),
                    const HomeScreenSearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.045),
                child: ListView(
                  padding: const EdgeInsets.only(),
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "Hi Salmaan!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(1)),
                      ),
                    ),
                    const QuickLinkSection(),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: const QnASection()),
                    const SizedBox(
                      height: 45,
                    ),
                    const TopUniversitiesSection(),
                    const SizedBox(
                      height: 45,
                    ),
                     const SizedBox(
                      height: 330,
                      child: VideosSection())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
