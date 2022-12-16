import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData sexSymbol;
  final String sexText;
  GenderCard({this.sexSymbol, this.sexText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          sexSymbol,
          size: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          sexText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
