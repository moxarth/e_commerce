import 'package:flutter/material.dart';

import '../../size_config.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  SectionTitle({@required this.press, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(20.0),
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "see more",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(18.0),
            ),
          ),
        ),
      ],
    );
  }
}
