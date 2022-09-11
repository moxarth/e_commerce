import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;

  CustomButton({
    this.isLoading,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool loading = isLoading ?? false;

    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        onPressed: onPressed,
        child: Stack(
          children: [
            Visibility(
              visible: loading ? false : true,
              child: Text(
                text ?? "Custom Button",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20.0),
                  color: Colors.white,
                ),
              ),
            ),
            Visibility(
              visible: loading,
              child: Container(
                height: getProportionateScreenHeight(30.0),
                width: getProportionateScreenWidth(50.0),
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenHeight(18.0),
            ),
          ),
        ),
      ),
    );
  }
}
