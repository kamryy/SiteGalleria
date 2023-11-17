

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class StudentDetailsPage extends StatefulWidget {
  StudentDetailsPage({super.key, required this.setStudentDetails});
  Function setStudentDetails;

  @override
  State<StudentDetailsPage> createState() => StudentDetailsPageState();
}

class StudentDetailsPageState extends State<StudentDetailsPage> {
  double spacing = 24;

  String? gender;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool saveStudentDetails() {
    bool passedRest = true;
    if (gender == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Select gender!")));
      passedRest = false;
    }

    if (_formKey.currentState!.validate() && passedRest) {
      Map<String, dynamic> studentDetails = {
        'fullName': _fullNameController.text,
        'email': _emailController.text,
        'mobileNumber': _mobileNumberController.text,
        'address': _addressController.text,
        'state': _stateController.text,
        'city': _cityController.text,
        'pincode': _pincodeController.text,
        'dob': _dobController.text,
        'gender': gender,
      };
      widget.setStudentDetails(studentDetails);
      return true;
    } else {
      return false;
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                        hintText: "Enter your full name",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Full name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _mobileNumberController,
                      decoration: const InputDecoration(
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(),
                        hintText: "Enter your mobile number",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Mobile number is required';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        hintText: "Enter your address",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _stateController,
                      decoration: const InputDecoration(
                        labelText: "State",
                        border: OutlineInputBorder(),
                        hintText: "Enter your state",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'State is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(),
                        hintText: "Enter your city",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _pincodeController,
                      decoration: const InputDecoration(
                        labelText: "Pincode",
                        border: OutlineInputBorder(),
                        hintText: "Enter your pincode",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Pincode is required';
                        }
                        if (value.length != 6) {
                          return 'Please enter a valid pincode';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                    TextFormField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                        labelText: "Date of Birth",
                        border: OutlineInputBorder(),
                        hintText: "Enter your date of birth",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Date of birth is required';
                        }

                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: spacing,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender",
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.75))),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    ChoiceChip(
                        selectedColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.15),
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
                            child: const Text("Male")),
                        selected: gender == "Male",
                        onSelected: (value) {
                          setState(() {
                            gender = "Male";
                          });
                        }),
                    const SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                        iconTheme: const IconThemeData(
                          size: 0,
                        ),
                        selectedColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.15),
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
                            child: const Text("Female")),
                        selected: gender == "Female",
                        onSelected: (value) {
                          setState(() {
                            gender = "Female";
                          });
                        }),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: spacing,
            ),
            Text("10th Marksheet",
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.75))),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16 + 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.75))),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Upload 10th Marksheet",
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.43,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.75))),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Ionicons.cloud_upload_outline,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.75),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spacing,
            ),
            Text("12th Marksheet",
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.75))),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16 + 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.75))),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Upload 12th Marksheet",
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.43,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.75))),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Ionicons.cloud_upload_outline,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.75),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
