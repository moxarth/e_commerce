import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isCenterTitle;
  final bool isTitle;
  final List actions;

  CustomAppBar({this.title, this.actions, this.isTitle, this.isCenterTitle});

  @override
  Widget build(BuildContext context) {
    bool isTitleLocal = isTitle ?? true;
    bool isCenterTitleLocal = isCenterTitle ?? false;

    return AppBar(
      title: isTitleLocal == true ? Text(title) : Text(""),
      centerTitle: isCenterTitleLocal,
      actions: actions,
    );
  }
}
