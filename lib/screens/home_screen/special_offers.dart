import 'package:flutter/material.dart';

import '../../size_config.dart';


class SpecialOffer extends StatelessWidget {
  final String category, image;
  final GestureTapCallback press;

  SpecialOffer({
    @required this.image,
    @required this.press,
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(right: getProportionateScreenHeight(10.0)),
        child: SizedBox(
          height: getProportionateScreenHeight(120.0),
          width: getProportionateScreenHeight(280.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.6),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(15.0),
                    vertical: getProportionateScreenHeight(10.0),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      text: category,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
