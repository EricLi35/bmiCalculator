import 'package:flutter/material.dart';
import 'constants.dart';

class PinkBottomButton extends StatelessWidget {
  String text;
  Function navFunc;

  PinkBottomButton({@required this.text, @required this.navFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEB1555),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 28,
          ),
        ),
        onPressed: navFunc,
      ),
    );
  }
}
