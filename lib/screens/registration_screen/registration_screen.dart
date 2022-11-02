import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz_tranzit/constants.dart';
import 'package:quiz_tranzit/screens/home_screen/home_screen_widgets/custom_rounded_button.dart';
import 'package:quiz_tranzit/screens/screens.dart';
import 'package:quiz_tranzit/services/questions_model.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static const String id = '/registration';
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  QuestionsModel questionsModel = QuestionsModel();
  String difficultyValue = difficulty.first;
  String questionsValue = questions.first;
  bool showSpinner = false;
  String? name;
  String? surname;
  String? age;

  void getQuestions(String questionsAmount, String difficulty) async {
    List questionsData = await questionsModel.getQuestions(questionsAmount, difficulty);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          questionsAnswers: questionsData,
        ),
      ),
    );
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Registration'),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        surname = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your surname'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your age'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select number of questions:',
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<String>(
                      value: questionsValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.red,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          questionsValue = value!;
                        });
                      },
                      items: questions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Choose difficulty:',
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<String>(
                      value: difficultyValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.red,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          difficultyValue = value!;
                        });
                      },
                      items: difficulty.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                CustomRoundedButton(
                    onPress: () async {
                      if (name == null ||
                          surname == null ||
                          age == null ||
                          name == '' ||
                          surname == '' ||
                          age == '') {
                        Fluttertoast.showToast(
                          msg: "Fill in all the fields",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      } else {
                        setState(() {
                          showSpinner = true;
                        });
                        getQuestions(questionsValue, difficultyValue);

                        Hive.box('players').put('$name', {
                          'name': name,
                          'surname': surname,
                          'age': age,
                          'difficulty': difficultyValue,
                          'questionsValue': questionsValue
                        });
                      }
                    },
                    title: 'Start!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
