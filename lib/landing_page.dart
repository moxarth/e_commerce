import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/screens/home_screen/home_page.dart';
import 'package:manan_mobile/screens/login_page.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

class LandingPage extends StatefulWidget {
  static String routeName = '/landing';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);

    if (_user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }

    // return FutureBuilder(
    //   future: _initialization,
    //   builder: (context, snapshot){
    //     if(snapshot.hasError){
    //       return Scaffold(
    //         body: Center(
    //           child: Text(
    //             snapshot.error,
    //           ),
    //         ),
    //       );
    //     }
    //
    //     return StreamBuilder(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, authSnapShot){
    //         if(authSnapShot.hasError){
    //           return Scaffold(
    //             body: Center(
    //               child: Text(
    //                 snapshot.error,
    //               ),
    //             ),
    //           );
    //         }
    //
    //         if(authSnapShot.connectionState == ConnectionState.active){
    //           User user = authSnapShot.data;
    //
    //           if(user == null){
    //             return LoginPage();
    //           } else {
    //             return HomePage();
    //           }
    //         }
    //         return Scaffold(
    //           body: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
