import 'package:flutter/material.dart';
import 'package:manan_mobile/landing_page.dart';
import 'package:manan_mobile/screens/forgot_password_page.dart';
import 'package:manan_mobile/screens/home_screen/home_page.dart';
import 'package:manan_mobile/screens/login_page.dart';
import 'package:manan_mobile/screens/product_screen/product_detail_page.dart';
import 'package:manan_mobile/screens/register_page.dart';
import 'package:manan_mobile/screens/splash_screen.dart';
import 'package:manan_mobile/screens/user_details_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LandingPage.routeName: (context) => LandingPage(),
  HomePage.routeName: (context) => HomePage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  UserDetailsPage.routeName: (context) => UserDetailsPage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  ProductDetailPage.routeName: (context) => ProductDetailPage(),
};
