import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class FacilitiesSection extends StatelessWidget {
  FacilitiesSection({super.key});

  List facilities = ["Library", "Hostel", "Canteen", "Sports", "Gym", "Wifi"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Facilities",
          style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(right: 24),
                child: Column(
                  children: [
                    Container(
                   
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      facilities[i],
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
              );
            },
            itemCount: facilities.length,
          ),
        )
      ],
    );
  }
}
