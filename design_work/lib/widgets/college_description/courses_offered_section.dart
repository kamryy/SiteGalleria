import 'package:design_work/services/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CoursesOfferedSection extends StatelessWidget {
  const CoursesOfferedSection({super.key});

  static List<Map> courses = [
    {
      "title": "Engineering and Architecture",
      "include": [
        "M.E / M.Tech",
        "B.E / B.Tech",
        "M.S",
        "+2 Degrees",
        "Diploma"
      ]
    },
    {
      "title": "Management and business Administration",
      "include": ["M.Phil.", "M.S", "MBA"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Courses Offered",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
            ),
            const Spacer(),
            Text(
              "View All",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ColumnBuilder(
            crossAxisAlignment: CrossAxisAlignment.start,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courses[i]["title"],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.75)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LayoutGrid(
                      columnSizes: const [auto, auto, auto, auto],
                      rowSizes: const [auto, auto],
                      gridFit: GridFit.loose,
                      rowGap: 8,
                      children: [
                        for (var ii = 0;
                            ii < courses[i]["include"].length;
                            ii++)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.5))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              courses[i]["include"][ii],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.33,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.5)),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: courses.length)
      ],
    );
  }
}
