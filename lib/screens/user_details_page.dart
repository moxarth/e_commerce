import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'package:manan_mobile/services/firestore_methods.dart';
import 'package:manan_mobile/widgets/custom_button.dart';
import 'package:manan_mobile/widgets/custom_input.dart';

import '../size_config.dart';

class UserDetailsPage extends StatefulWidget {
  static String routeName = '/user_details';

  // final String email;
  // final String password;
  //
  // UserDetailsPage({
  //   this.password,
  //   this.email,
  // });

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  String userName = '', address = '';
  int phoneNumber;
  final _formKey = GlobalKey<FormState>();
  bool isLoading;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Details"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Complete Profile",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(35),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Text(
                "fill all the user details",
                style: TextStyle(fontSize: getProportionateScreenHeight(18)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your username';
                          }
                        },
                        hintText: "Enter Your Username",
                        textInputAction: TextInputAction.next,
                        label: "Username",
                        iconData: Icon(
                          EvaIcons.emailOutline,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          userName = value;
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your contact number';
                          } else if (value.length != 10) {
                            return 'provide valid phone number';
                          }
                        },
                        hintText: "Enter your contact number",
                        label: "Mobile Number",
                        iconData: Icon(
                          Icons.smartphone,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          phoneNumber = int.parse(value);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your address';
                          }
                        },
                        hintText: "Enter your current address",
                        label: "Address",
                        iconData: Icon(
                          Icons.location_on_outlined,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = false;
                            });
                            FireStoreMethods().addUserToFireStore(
                              username: userName,
                              phoneNumber: phoneNumber,
                              address: address,
                            );
                          }
                        },
                        text: "Complete",
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
