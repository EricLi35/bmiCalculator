import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'pinkBottomButton.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female, none }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double currentValue = 120;
  int weight = 60;
  int age = 21;

  void handleTap(Gender input) {
    setState(() {
      selectedGender == input
          ? selectedGender = Gender.none
          : selectedGender = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: GenderCard(
                        sexSymbol: FontAwesomeIcons.mars,
                        sexText: "MALE",
                      ),
                      myFunc: () {
                        handleTap(Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: GenderCard(
                        sexSymbol: FontAwesomeIcons.venus,
                        sexText: "FEMALE",
                      ),
                      myFunc: () {
                        handleTap(Gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      // we use row to make the number and cm text sit on the same baseline
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          currentValue == 120
                              ? "120.0"
                              : currentValue.toString().substring(0, 5),
                          style: kNumberTextStyle,
                        ),
                        Text('cm', style: kLabelTextStyle)
                      ],
                    ),
                    Slider(
                      value: currentValue,
                      min: 120,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      },
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  weightAgeCard("weight"),
                  weightAgeCard("age"),
                ],
              ),
            ),
            PinkBottomButton(
              text: "CALCULATE",
              navFunc: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      height: currentValue,
                      weight: weight,
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }

  Expanded weightAgeCard(String category) {
    return Expanded(
      child: ReusableCard(
        colour: kInactiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.toUpperCase(),
              style: kLabelTextStyle,
            ),
            Text(
              category == 'age' ? age.toString() : weight.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addMinusButton(category, Icons.remove),
                addMinusButton(category, Icons.add),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton addMinusButton(String category, IconData iconType) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        backgroundColor: MaterialStateProperty.all(
          Color(0XFF181818),
        ),
      ),
      onPressed: () {
        setState(() {
          if (category == "weight" && iconType == Icons.add) {
            weight++;
          } else if (category == "weight" && iconType == Icons.remove) {
            weight--;
          } else if (category == "age" && iconType == Icons.add) {
            age++;
          } else if (category == "age" && iconType == Icons.remove) {
            age > 1 ? age-- : null;
          }
        });
      },
      child: Icon(
        iconType,
        color: Colors.white,
      ),
    );
  }
}
