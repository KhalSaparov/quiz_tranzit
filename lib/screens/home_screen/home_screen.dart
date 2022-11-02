import 'package:flutter/material.dart';
import 'package:quiz_tranzit/screens/home_screen/home_screen_widgets/custom_rounded_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: const Text('Turkmen Tranzit Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              onPress: () {
                Navigator.pushNamed(context, '/registration');
              },
              title: 'Start',
            ),
            CustomRoundedButton(
              onPress: () {
                Navigator.pushNamed(context, '/rating');
              },
              title: 'Rating',
            ),
          ],
        ),
      ),
    );
  }
}
