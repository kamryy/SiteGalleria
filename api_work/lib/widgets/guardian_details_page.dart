import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GuardianDetailsPage extends StatefulWidget {
  const GuardianDetailsPage({super.key, required this.setGuardianDetails});
  final Function setGuardianDetails;

  @override
  State<GuardianDetailsPage> createState() => GuardianDetailsPageState();
}

class GuardianDetailsPageState extends State<GuardianDetailsPage> {
  final double spacing = 24;
  final List<String> relationsList = ["Father", "Mother", "Guardian"];
  String? relation;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Creating TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  bool saveGuardianDetails() {
    if (relation == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please select a relation"),
      ));
      return false;
    }
    if (formKey.currentState!.validate()) {
      widget.setGuardianDetails({
        "name": nameController.text,
        "relation": relation,
        "email": emailController.text,
        "mobileNumber": mobileNumberController.text,
        "address": addressController.text,
        "state": stateController.text,
        "city": cityController.text,
        "pincode": pincodeController.text,
        "dob": dobController.text,
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      hintText: "Enter your name",
                    ),
                  ),
                  SizedBox(height: spacing),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Relation",
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.75))),
                      const SizedBox(height: 5),
                      Row(
                        children: List.generate(
                          relationsList.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                                selectedColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.05),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2),
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                label: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 8),
                                    child: Text(relationsList[index])),
                                selected: relation == relationsList[index],
                                onSelected: (value) {
                                  setState(() {
                                    relation = relationsList[index];
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more sophisticated validation for email if needed
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      hintText: "Enter your email",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: mobileNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      // Add more sophisticated validation for mobile number if needed
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Mobile number",
                      border: OutlineInputBorder(),
                      hintText: "Enter your mobile number",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder(),
                      hintText: "Enter your address",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: stateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your state';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "State",
                      border: OutlineInputBorder(),
                      hintText: "Enter your state",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                      hintText: "Enter your city",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: pincodeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pincode';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Pincode",
                      border: OutlineInputBorder(),
                      hintText: "Enter your pincode",
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: dobController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                      hintText: "Enter your date of birth",
                    ),
                  ),
                  SizedBox(height: spacing),
                  // You can add a submit button here to handle form submission
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Disposing controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    stateController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    dobController.dispose();
    super.dispose();
  }
}
