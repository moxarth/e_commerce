import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar({this.rating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10.0),
            vertical: getProportionateScreenWidth(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(45),
              width: getProportionateScreenHeight(45),
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(12.0),
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(6.0),
                horizontal: getProportionateScreenWidth(15.0),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(16.0),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: getProportionateScreenHeight(5),
                  ),
                  Icon(
                    EvaIcons.star,
                    color: Colors.orange,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
