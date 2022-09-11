import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manan_mobile/routes.dart';
import 'package:manan_mobile/screens/splash_screen.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'package:manan_mobile/size_config.dart';
import 'package:provider/provider.dart';

import 'landing_page.dart';
import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthServices().userStream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Manan_Mobile',
          theme: ThemeData(
            primaryColor: Colors.orange,
            textTheme: GoogleFonts.muliTextTheme(),
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black54),
              textTheme: TextTheme(
                headline6: GoogleFonts.muli(
                  color: Colors.black54,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              brightness: Brightness.light,
              color: Colors.white,
              elevation: 0.0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: routes,
        );
      },
    );
  }
}
