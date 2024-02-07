import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final kColorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 121, 85, 72));

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          )),
      theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.brown[100],
          colorScheme: kColorSchema,
          cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          )),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}
