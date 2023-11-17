import 'package:api_work/repo/exam_application_repositories.dart';
import 'package:api_work/screens/application_succeeded_screen.dart';
import 'package:api_work/widgets/exam_options_page.dart';
import 'package:api_work/widgets/guardian_details_page.dart';
import 'package:api_work/widgets/payment_page.dart';
import 'package:api_work/widgets/student_details_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ExamsApplicationScreen extends StatefulWidget {
  ExamsApplicationScreen({super.key, required this.examRepositories});
  ExamRepositories examRepositories;
  @override
  State<ExamsApplicationScreen> createState() => _ExamsApplicationScreenState();
}

class _ExamsApplicationScreenState extends State<ExamsApplicationScreen> {
  List exams = [
    "SRM Entrance",
    "JEE",
    "JEE Advanced",
    "NEET",
    "GATE",
    "NPTEL",
    "DESIGN",
    "VIT Entrance",
  ];
  List paymentOptions = const ["Google Pay", "PhonePe", "Credit Card"];
  double valueOfLinearProgressIndicator = 0.2;
  int? indexOfSelectedExam;
  Map? paymentDetails;
  Map? studentDetails;
  Map? guardianDetails;
  void setStudentDetails(Map studentDetails) {
    this.studentDetails = studentDetails;
  }

  void setGuardianDetails(Map guardianDetails) {
    this.guardianDetails = guardianDetails;
  }

  void setIndexOfSelectedExam(int index) {
    indexOfSelectedExam = index;
  }

  void setPaymentDetails(Map paymentDetails) {
    this.paymentDetails = paymentDetails;
  }

  PageController pageController = PageController();

  int step = const int.fromEnvironment("step", defaultValue: 0);
  GlobalKey<StudentDetailsPageState> studentDetailsPageKey =
      GlobalKey<StudentDetailsPageState>();

  GlobalKey<GuardianDetailsPageState> guardianDetailsPageKey =
      GlobalKey<GuardianDetailsPageState>();

  GlobalKey<PaymentPageState> paymentPageKey = GlobalKey<PaymentPageState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: step < 3
          ? InkWell(
              onTap: () {
                if (step == 0) {
                  if (indexOfSelectedExam != null) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);

                    setState(() {
                      step++;
                      valueOfLinearProgressIndicator = 0.5;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please select an exam to continue")));
                  }
                } else if (step == 1) {
                  if (studentDetailsPageKey.currentState!
                      .saveStudentDetails()) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    setState(() {
                      step++;
                      valueOfLinearProgressIndicator = 0.75;
                    });
                  }
                } else if (step == 2) {
                  if (guardianDetailsPageKey.currentState!
                      .saveGuardianDetails()) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    setState(() {
                      step++;
                      valueOfLinearProgressIndicator = 0.9;
                    });
                  }
                }
              },
              child: const NextButton())
          : const Center(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: step == 3
          ? Container(
              height: 80 + MediaQuery.of(context).padding.bottom,
              color: Colors.grey[200],
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: 8 + MediaQuery.of(context).padding.bottom,
                  top: 8),
              child: Row(
                children: [
                  Text("₹49.00",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary)),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Material(
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(1),
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        onTap: () async {
                          if (paymentPageKey.currentState!
                              .setPaymentDetails()) {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            setState(() {
                              step++;
                              valueOfLinearProgressIndicator = 1;
                            });
                            print(
                                "student details : $studentDetails, guardian details: $guardianDetails, exam name : ${exams[indexOfSelectedExam!]}, payment details : $paymentDetails]}");
                            widget.examRepositories.submitApplication(
                                student_details: studentDetails!,
                                guardian_details: guardianDetails!,
                                chosenExam: exams[indexOfSelectedExam!],
                                payment_details: paymentDetails!);
                          }
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: const Text(
                              "Pay Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              height: 1 / 1000,
            ),
      body: Column(
        children: [
          const ApplicationFormAppBar(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(
              value: valueOfLinearProgressIndicator,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              backgroundColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              ExamOptionsPage(
                exams: exams,
                setIndexOfSelectedExam: setIndexOfSelectedExam,
              ),
              StudentDetailsPage(
                  key: studentDetailsPageKey,
                  setStudentDetails: setStudentDetails),
              GuardianDetailsPage(
                setGuardianDetails: setGuardianDetails,
                key: guardianDetailsPageKey,
              ),
              PaymentPage(
                key: paymentPageKey,
                setPaymentDetails: setPaymentDetails,
                paymentOptions: paymentOptions,
              ),
              const ApplicationSucceededScreen()
            ],
          ))
        ],
      ),
    );
  }
}

class ApplicationFormAppBar extends StatelessWidget {
  const ApplicationFormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: 65 + MediaQuery.of(context).padding.top,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 14, 102, 143),
        Color.fromARGB(255, 98, 155, 182)
      ])),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 14,
          ),
          Icon(
            Ionicons.arrow_back,
            size: 32,
            color: Colors.white,
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "Application Form",
            style: TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Next",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
