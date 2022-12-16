import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0XFF181818)),
        // accentColor: Colors.yellow,
        scaffoldBackgroundColor: Color(0XFF181818),
      ),
      home: InputPage(),
    );
  }
}
