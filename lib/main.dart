import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('players');
  await Hive.openBox('score');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        Registration.id: (context) => const Registration(),
        GameScreen.id: (context) => const GameScreen(),
        RatingScreen.id: (context) => const RatingScreen(),
      },
    );
  }
}
