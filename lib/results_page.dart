import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'pinkBottomButton.dart';

class ResultsPage extends StatelessWidget {
  double officialHeight;
  double officialWeight;
  double bmi;
  String status;

  Map<String, String> map1 = {
    "underweight":
        "You have a lower than normal body weight. You should eat more.",
    "normal weight": "You have a normal body weight. Good job!",
    "overweight":
        "You have a higher than normal body weight. You should exercise more.",
    "obese": "Please go see the doctor"
  };

  ResultsPage({double height, int weight}) {
    officialHeight = height / 100;
    officialWeight = weight.toDouble();
    bmi = officialWeight / (officialHeight * officialHeight);
  }

  @override
  Widget build(BuildContext context) {
    if (bmi < 18.5) {
      status = "underweight";
    } else if (bmi < 25) {
      status = "normal weight";
    } else if (bmi < 30) {
      status = "overweight";
    } else {
      status = "obese";
    }

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0XFF181818)),
        // accentColor: Colors.yellow,
        scaffoldBackgroundColor: Color(0XFF181818),
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: TextButton(
          //   child: Icon(
          //     Icons.chevron_left,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          title: Text(
            "Your Result",
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        status.toUpperCase(),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmi.toString().substring(0, 4),
                        style: TextStyle(
                            fontSize: 90, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        map1[status],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            PinkBottomButton(
              text: "RE-CALCULATE",
              navFunc: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
