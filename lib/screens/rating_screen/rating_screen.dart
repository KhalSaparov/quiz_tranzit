import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);
  static const String id = '/rating';

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  List player() {
    List keys = [];
    Hive.box('players').keys.forEach((element) {
      keys.add(element);
    });
    List player = [];
    List score = [];
    score.add(Hive.box('score')
        .get('score')
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll(',', '\n'));

    for (var key in keys) {
      var person = Hive.box('players')
          .get(key)
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll(',', '\n');
      var score = Hive.box('score')
          .get('score')
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll(',', '\n');
      player.add(person);
      player.add(score);
    }
    return player;
  }

  @override
  Widget build(BuildContext context) {
    var players = player();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Rating'),
      ),
      body: SingleChildScrollView(
          child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: players.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                players[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
            ],
          );
        },
      )),
    );
  }
}
