import 'package:flutter/material.dart';

class GetOtpButton extends StatefulWidget {
  // Declaration of a Function variable to handle button press.
  Function onPressed;

  // Constructor for the widget, accepting a function for onPressed.
  GetOtpButton({super.key, required this.onPressed});

  @override
  State<GetOtpButton> createState() => GetOtpButtonState();
}

class GetOtpButtonState extends State<GetOtpButton> {
  // A boolean variable to control the button's active state.
  bool active = false;

  @override
  Widget build(BuildContext context) {
    // Building a container that holds an ElevatedButton.
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        // Styling for the ElevatedButton.
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          elevation: 0,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        // The button is enabled or disabled based on the 'active' state.
        onPressed: active ? () => widget.onPressed : null,
        // Content of the ElevatedButton, including text and an icon.
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get OTP",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, height: 1.5),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
