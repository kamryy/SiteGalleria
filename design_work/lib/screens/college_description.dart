import 'dart:math';

import 'package:design_work/widgets/college_description/adress_section.dart';
import 'package:design_work/widgets/college_description/courses_offered_section.dart';
import 'package:design_work/widgets/college_description/description_header.dart';
import 'package:design_work/widgets/college_description/exams_accepted_section.dart';
import 'package:design_work/widgets/college_description/facilities_section.dart';
import 'package:design_work/widgets/college_description/highlights_section.dart';
import 'package:design_work/widgets/college_description/popular_courses_section.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CollegeDescriptionScreen extends StatelessWidget {
  const CollegeDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              height: 65 + MediaQuery.of(context).padding.top,
              color: Theme.of(context).colorScheme.primary,
              child: const Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Icon(
                    Ionicons.arrow_back,
                    size: 32,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const ClampingScrollPhysics(),
                children: [
                  const DescriptionHeader(),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          "IIT Madras - Indian Institute Of Technology Madras: Admission 2023, Rankings, Courses...",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.location_outline,
                              size: 15,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.50),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Adyar",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.43,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.50)),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.20),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Autonomous",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.43,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.50)),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.20),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 5),
                            Text("#10",
                                style: TextStyle(
                                    fontSize: 14,
                                    height: 1.43,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(1)))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {},
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    "Will you get in?",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                        .withOpacity(1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Brochure",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Ionicons.download_outline,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    height: 1,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HighlightsSection(),
                        const SizedBox(
                          height: 14,
                        ),
                        const CoursesOfferedSection(),
                        const SizedBox(
                          height: 6,
                        ),
                        const PopularCoursesSection(),
                        const SizedBox(
                          height: 6,
                        ),
                        FacilitiesSection(),
                        const SizedBox(
                          height: 30,
                        ),
                        const ExamsAcceptedSection(),
                        const SizedBox(
                          height: 25,
                        ),
                        const AddressSection(),
                        const SizedBox(height: 50,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
