import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage(
      {super.key,
      required this.paymentOptions,
      required this.setPaymentDetails});
  Function setPaymentDetails;
  List paymentOptions;

  @override
  State<PaymentPage> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  int? chosenIndex = 0;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool setPaymentDetails() {
    if (chosenIndex != null) {
      widget.setPaymentDetails({
        "paymentOption": widget.paymentOptions[chosenIndex!],
        "cardNumber": "",
        "expiryDate": "",
        "cvv": "",
      });
      return true;
    } else {
      if (formKey.currentState!.validate()) {
        widget.setPaymentDetails({
          "paymentOption": widget.paymentOptions[chosenIndex!],
          "cardNumber": cardNumberController.text,
          "expiryDate": expiryDateController.text,
          "cvv": cvvController.text,
        });
        return true;
      }
      return false;
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    width: 1),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount to be paid",
                        style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(1)),
                      ),
                      const Text("Application Form",
                          style: TextStyle(fontSize: 12, height: 1.33)),
                    ],
                  ),
                  Text("₹49.00",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Select Payment Options",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(1)),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      width: 1),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UPI",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                        children: List.generate(
                      widget.paymentOptions.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(),
                          title: Text(widget.paymentOptions[index]),
                          onTap: () {
                            setState(() {
                              chosenIndex = index;
                            });
                          },
                          leading: Image.network(
                            "https://s3-alpha-sig.figma.com/img/bccf/40ef/0d51ade359900027c9bd416d09e9658d?Expires=1701043200&Signature=PoljzQ5-X827kgSUh50rxAY~Uep5VDy9Q3FWC0t4xpCC8mCWT2JMogGcakNthQ3Vyxr1Y66ccWki0nl3GT0z3MQ6hIeZ5uaMQVAPRw6t4Kjy3AiNuFRCq2QALPwaQKY5~Gs9jm9ybUM44bg96Vn8oyS6Q8SOLcar11p~JTRS7IaP7wVesa6yZzjAGhKNypCRmWQoAIbFGl1JhjFDx-Ci6wRkhRG4lKB-hJSOyXw~stEVBjHPYxix9NvVDuAi2erzbLrVHMrVKNwSd3Lu4BTIsmd9OfiupaGLxGM2Be5ZSnu29OS1Zpk2GgPkH6YTdE6BEiNk5QUDypvD3amquQNU3Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                            width: 56,
                            height: 56,
                          ),
                          trailing: Icon(
                            chosenIndex == index
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(1),
                          ),
                        ),
                      ),
                    ))
                  ],
                )),
            const SizedBox(
              height: 18,
            ),
            widget.paymentOptions[chosenIndex!] == "Credit Card" ?
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      width: 1),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CREDIT/DEBIT/ATM CARD",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter card number";
                            }
                            return null;
                          },
                          controller: cardNumberController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.remove_circle_outline),
                            hintText: "Enter Card Number",
                            labelText: "Card Number",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter expiry date";
                                  }
                                  return null;
                                },
                                controller: expiryDateController,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: "MM/YY",
                                  labelText: "Expiry Date",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter CVV";
                                  }
                                  return null;
                                },
                                controller: cvvController,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  suffixIcon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  hintText: "CVV",
                                  labelText: "CVV",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    )
                  ],
                )) : Container()
          ],
        )));
  }
}
