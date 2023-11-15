import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class QuickLinkSection extends StatelessWidget {
  const QuickLinkSection({super.key});

  // A static list containing information about each quick link.
  static List quickLinks = [
    {
      "icon": Ionicons.chatbubbles_outline,
      "title": "Ask a Question",
    },
    {
      "icon": Ionicons.school_outline,
      "title": "Colleges",
    },
    {
      "icon": Ionicons.shield_checkmark_outline,
      "title": "Exams",
    },
    {
      "icon": Ionicons.bar_chart_outline,
      "title": "Predictors",
    },
    {
      "icon": Ionicons.people_outline,
      "title": "Compare Colleges",
    },
    {
      "icon": Ionicons.trophy_outline,
      "title": "College Rankings",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text widget for the section title 'Quick Links'.
        Text("Quick Links",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.75))),

        const SizedBox(height: 15), // SizedBox for spacing.

        // GridView.builder to create a grid of quick link items.
        GridView.builder(
          shrinkWrap:
              true, // Ensures that the grid takes up only required space.
          padding: EdgeInsets.zero, // No padding around the grid.
          physics:
              const NeverScrollableScrollPhysics(), // Makes the grid non-scrollable.
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Sets the number of columns in the grid.
            crossAxisSpacing: 15, // Horizontal space between grid items.
            mainAxisSpacing: 15, // Vertical space between grid items.
            childAspectRatio: 1.25, // Aspect ratio for each grid item.
          ),
          itemCount: quickLinks.length, // Number of items in the grid.
          itemBuilder: (context, index) {

            // Builder function to create each grid item.
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              onTap: () {
                // Placeholder for an onTap action.
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon for the quick link.
                      Icon(quickLinks[index]["icon"],
                          size: 34,
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withOpacity(1)),
                      const SizedBox(height: 10),
                      // Text for the quick link title.
                      Text(
                        quickLinks[index]["title"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
