import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final Icon iconData;
  final bool obscuredText;
  final Function(String) validator;
  final TextInputAction textInputAction;

  CustomInput(
      {this.validator,
      this.focusNode,
      this.obscuredText,
      this.hintText,
      this.label,
      this.onChanged,
      this.onSubmitted,
      this.iconData,
      this.textInputAction});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    bool obsText = widget.obscuredText ?? false;
    TextInputAction textInputAction = widget.textInputAction;

    return TextFormField(
      validator: widget.validator,
      focusNode: widget.focusNode,
      textInputAction: textInputAction,
      obscureText: obsText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: widget.iconData,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: getProportionateScreenHeight(22),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
            horizontal: getProportionateScreenWidth(75)),
        border: OutlineInputBorder(
          gapPadding: 3.0,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
          borderSide: BorderSide(width: 2.0, color: Colors.orange),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 3.0,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
          borderSide: BorderSide(width: 2.0, color: Colors.orange),
        ),
      ),
    );
  }
}
