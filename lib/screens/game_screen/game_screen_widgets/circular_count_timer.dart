import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CircularCountTimer extends StatelessWidget {
  CircularCountTimer(this.time, this.correctAnswer, {Key? key}) : super(key: key);

  List time;
  int correctAnswer;

  final CountDownController controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 10 * time.length,
      initialDuration: 0,
      controller: controller,
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 5,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.redAccent[100]!,
      fillGradient: null,
      backgroundColor: Colors.red[500],
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        // debugPrint('Countdown Started');
      },
      onComplete: () {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Score",
          desc: "Correct answers:$correctAnswer\nIncorrect answers:${time.length - correctAnswer}",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              width: 120,
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      },
      onChange: (String timeStamp) {
        // debugPrint('Countdown Changed $timeStamp');
      },
    );
  }
}
