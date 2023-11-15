import 'package:flutter/material.dart';

class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Highlights",
          style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          height: 310,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HighlightItem(
                  title: "Established",
                  value: "1958",
                ),
                HighlightItem(
                  title: "Ownership",
                  value: "Public / Government",
                ),
                HighlightItem(title: "Institute Type", value: "University"),
                HighlightItem(
                  title: "Campus Size",
                  value: "550.0 acres",
                ),
                HighlightItem(
                  title: "Studen Count",
                  value: "12004",
                ),
                HighlightItem(title: "Faculty Count", value: "673"),
                HighlightItem(
                  title: "Gender",
                  border: false,
                  value: "Co-ed",
                ),
              ]),
        )
      ],
    );
  }
}

class HighlightItem extends StatelessWidget {
  HighlightItem(
      {super.key,
      required this.title,
      required this.value,
      this.border = true});
  String title;
  String value;
  bool border;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: border
              ? Border(
                  bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ))
              : const Border()),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.75)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
