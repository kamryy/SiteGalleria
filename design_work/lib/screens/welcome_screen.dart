/// This file contains the [WelcomeScreen] widget which is a stateless widget that displays a welcome message and a mobile number input field.
///
/// The [WelcomeScreen] widget imports the [MobileNumberInput] widget from the mobile_number_input.dart file.
///
/// The [WelcomeScreen] widget is used to access personalized academic resources.
///
/// Example:
///
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(builder: (context) => WelcomeScreen()),
/// );
/// ```
///
import 'package:design_work/widgets/welcome_screen/get_otp_button.dart';
import 'package:design_work/widgets/welcome_screen/mobile_number_input.dart';
import 'package:design_work/widgets/welcome_screen/other_login_options.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GlobalKey<GetOtpButtonState> _getOtpButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01 +
                MediaQuery.of(context).padding.top),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.065),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome!",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text("Sign in to access personalized academic resources.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            MobileNumberInput(
              getOtpButtonKey: _getOtpButtonKey,
            ),
            GetOtpButton(
              onPressed: () {},
              key: _getOtpButtonKey,
            ),
            const OtherLoginOptions()
          ],
        ),
      ),
    );
  }
}
