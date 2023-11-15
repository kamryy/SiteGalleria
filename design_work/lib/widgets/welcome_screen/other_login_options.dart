import 'package:flutter/material.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle styling = TextStyle(
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          "or",
          style: styling,
        ),
         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text("Login with", style: styling),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google.png"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Image.asset("assets/images/facebook.png")
          ],
        )
      ],
    );
  }
}
