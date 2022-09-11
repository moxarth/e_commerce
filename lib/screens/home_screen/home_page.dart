import 'package:flutter/material.dart';
import 'package:manan_mobile/screens/home_screen/home_body.dart';
import 'package:manan_mobile/size_config.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

// ElevatedButton(
// onPressed: () async {
// await _authServices.signOut();
// },
// child: Text("LogOut"),
// )
