import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_tranzit/services/get_questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'game_screen_widgets/circular_count_timer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, this.questionsAnswers}) : super(key: key);

  final dynamic questionsAnswers;
  static const String id = '/game';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<dynamic> questionsAnswers;

  int questNumber = 0;
  int correctAnswer = 0;
  int inCorrectAnswer = 0;
  late List answers;

  @override
  Widget build(BuildContext context) {
    questionsAnswers = widget.questionsAnswers;
    GetQuestions getQuestions = GetQuestions(data: questionsAnswers);
    answers = getQuestions.getAnswers();

    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                questionsAnswers[questNumber]['question'],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
        const Divider(
          height: 10,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.red,
        ),
        Expanded(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: buildTextButton(0)),
                        Expanded(child: buildTextButton(1)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: buildTextButton(2)),
                        Expanded(child: buildTextButton(3)),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: CircularCountTimer(questionsAnswers, correctAnswer),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextButton buildTextButton(int i) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (answers[questNumber][i].toString() ==
              questionsAnswers[questNumber]['correctAnswer'].toString()) {
            correctAnswer++;
          } else {
            inCorrectAnswer++;
          }
          if (questNumber < questionsAnswers.length - 1) {
            questNumber++;
          } else {
            Alert(
              context: context,
              type: AlertType.success,
              title: "Score",
              desc: "Correct answers:$correctAnswer\nUncorrect answers:$inCorrectAnswer",
              buttons: [
                DialogButton(
                  onPressed: () async {
                    Hive.box('score').put('score', {
                      'correct': '$correctAnswer',
                      'incorrect': '$inCorrectAnswer',
                    });
                    questNumber = 0;
                    correctAnswer = 0;
                    inCorrectAnswer = 0;
                    Navigator.pushNamed(context, '/home');
                  },
                  width: 120,
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          }
        });
      },
      child: Text(answers[questNumber][i].toString(),
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
    );
  }
}
