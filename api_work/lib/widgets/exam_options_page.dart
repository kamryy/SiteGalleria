import 'package:flutter/material.dart';

class ExamOptionsPage extends StatefulWidget {
  ExamOptionsPage(
      {super.key, required this.exams, required this.setIndexOfSelectedExam});
  List exams;
  Function setIndexOfSelectedExam;
  @override
  State<ExamOptionsPage> createState() => _ExamOptionsPageState();
}

class _ExamOptionsPageState extends State<ExamOptionsPage> {
  late Map values;
  @override
  void initState() {
    values = Map.fromIterables(
        List.generate(widget.exams.length, (index) => index),
        List.generate(8, (index) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            widget.exams.length,
            (index) => ListTile(
                  leading: Checkbox(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: values[index],
                    onChanged: (value) {
                      setState(() {
                        // Set the selected checkbox value to true
                        values[index] = value;
                        // Deselect all other checkboxes
                        for (int i = 0; i < values.length; i++) {
                          if (i != index) {
                            values[i] = false;
                          }
                        }
                        // Set the index of the selected exam
                        widget.setIndexOfSelectedExam(index);
                      });
                    },
                  ),
                  title: Text(
                    widget.exams[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                )));
  }
}
