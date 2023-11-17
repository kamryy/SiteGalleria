import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uuid/uuid.dart';

class ExamRepositories {
  // This constructor initializes the GraphQL client. The client is used for making GraphQL queries and mutations.
  ExamRepositories({required this.client});
  GraphQLClient client;

  // This method handles the submission of exam applications. It's an async method, which is important for handling the network request.
  void submitApplication({
    required Map student_details,
    required Map guardian_details,
    required Map payment_details,
    required String chosenExam,
  }) async {
    const uuid = Uuid();
    // Unique IDs are generated for each entity using Uuid. This ensures that each entity can be uniquely identified in the database.
    final studentDetailsId = uuid.v4();
    final guardianDetailsId = uuid.v4();
    final paymentDetailsId = uuid.v4();
    final examApplicationId = uuid.v4();

    // The GraphQL mutation string. This is a crucial part of the code where the structure of the data to be sent to the server is defined.
    const String submitApplicationMutation = '''
  mutation Mutation(\$input: [StudentDetailsCreateInput!]!) {
  createStudentDetails(input: \$input) {
    __typename
  }
}
''';
    // MutationOptions are set up here. This includes the mutation query and the variables that will be passed to it.

    MutationOptions options =
        MutationOptions(document: gql(submitApplicationMutation), variables: {
      "input": [
        {
          // Linking the exam application with the student details
          "examapplicationHas": {
            "create": {
              "node": {"ExamName": chosenExam, "id": examApplicationId}
            }
          },
          // Student details fields
          "address": student_details["address"],
          "dateOfBirth": student_details["dateOfBirth"],
          "city": student_details["city"],
          "email": student_details["email"],
          "fullName": student_details["fullName"],
          "gender": student_details["gender"].toString().toUpperCase(),
          // Guardian details nested within student details
          "hasGuardiandetails": {
            "create": {
              "node": {
                "address": guardian_details["address"],
                "city": guardian_details["city"],
                "email": guardian_details["email"],
                "dateOfBirth": guardian_details["dateOfBirth"],
                "name": guardian_details["name"],
                "id": guardianDetailsId,
                "phoneNumber": guardian_details["phoneNumber"],
                "relation":
                    guardian_details["relation"].toString().toUpperCase(),
                "state": guardian_details["state"],
              }
            }
          },
          // Payment details nested within student details
          "hasPaymentdetails": {
            "create": {
              "node": {
                "amount": payment_details["amount"],
                "date": DateTime.now().toString(),
                "paymentOption": payment_details["paymentOption"],
                "id": paymentDetailsId,
              }
            }
          },
          // More student details
          "id": studentDetailsId,
          "phonNumber": student_details["phonNumber"],
          "pinCode": student_details["pinCode"],
          "twelfthMarksheetUrl": student_details["twelfthMarksheetUrl"],
          "tenthMarkSheetUrl": student_details["tenthMarkSheetUrl"],
          "state": student_details["state"],
        }
      ]
    });

    // The mutation is executed here. This is a critical part of the code as it sends the data to the server and waits for a response.
    await client.mutate(options).then((value) => print(value));
  }
}
