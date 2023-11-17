import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ApplicationSucceededScreen extends StatelessWidget {
  const ApplicationSucceededScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Ionicons.checkmark_circle_outline,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            'Your application has been submitted successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
