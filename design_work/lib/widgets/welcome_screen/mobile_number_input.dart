import 'package:design_work/widgets/welcome_screen/get_otp_button.dart';
import 'package:flutter/material.dart';

class MobileNumberInput extends StatefulWidget {
  // GlobalKey to interact with the GetOtpButton widget.
  GlobalKey<GetOtpButtonState> getOtpButtonKey;

  // Constructor that takes a GlobalKey for the GetOtpButtonState.
  MobileNumberInput({super.key, required this.getOtpButtonKey});

  @override
  _MobileNumberInputState createState() => _MobileNumberInputState();
}

class _MobileNumberInputState extends State<MobileNumberInput> {
  // Default country code set to '+1'.
  String _selectedCountryCode = '+1'; 

  @override
  Widget build(BuildContext context) {
    // Container for the input field and dropdown.
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          // Dropdown for selecting country code.
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCountryCode,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountryCode = newValue!;
                });
              },
              items: <String>['+1', '+91', '+44', '+81'] // List of country codes.
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                );
              }).toList(),
            ),
          ),
          // TextField for the mobile number input.
          Expanded(
            child: TextField(
              onChanged: (value) {
                // Enabling or disabling the Get OTP button based on the input.
                widget.getOtpButtonKey.currentState!.setState(() {
                  widget.getOtpButtonKey.currentState!.active = value.isNotEmpty;
                });
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
                hintText: '00000 00000', // Placeholder text for the phone number.
                hintStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
