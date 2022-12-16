import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function myFunc;
  ReusableCard({@required this.colour, this.cardChild, this.myFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myFunc,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
