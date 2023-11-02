import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import '../constants.dart';

// ignore: duplicate_import
import '../models/question_model.dart';
import '../widgest/question_widgest.dart';
import '../widgest/next_button.dart';
import '../widgest/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<question> _questions = [
    question(
        id: '10',
        title: 'what is 2+2 ?',
        options: {'5': false, '20': false, '4': true, '14': false}),
    question(
        id: '10',
        title: 'what is 2+3 ?',
        options: {'5': true, '20': false, '4': false, '14': false}),
    question(
        id: '10',
        title: 'what is 2+8 ?',
        options: {'5': false, '10': true, '4': false, '14': false})
  ];
  int index = 0;
  bool ispressed = false;
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        ispressed = false;
      });
    }
  }

  void changecolor() {
    setState(() {
      ispressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            questionWidget(
                question: _questions[index].title,
                indexAction: index,
                totalQuestions: _questions.length),
            const Divider(color: neutral),
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              optioncard(
                option: _questions[index].options.keys.toList()[i],
                color: ispressed
                    ? _questions[index].options.values.toList()[i] == true
                        ? correct
                        : inccorrect
                    : neutral,
                onTap: changecolor,
              )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
