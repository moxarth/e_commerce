import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/models/user_model.dart';
import 'package:manan_mobile/screens/login_page.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'package:manan_mobile/services/firestore_methods.dart';
import 'package:manan_mobile/size_config.dart';
import 'package:manan_mobile/widgets/custom_button.dart';
import 'package:manan_mobile/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Register",
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(formKey: _formKey),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthServices _authServices = AuthServices();
  String email = '', password = '', confirmPassword = '';
  FocusNode _passwordFocusNode;
  bool isLoading;
  bool isForgetPasswordChecked = false;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Register Account",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(35),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Text(
                "complete your details",
                style: TextStyle(fontSize: getProportionateScreenHeight(18)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(60.0),
              ),
              Form(
                key: widget._formKey,
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
                          final bool isValidate =
                              EmailValidator.validate(value);
                          if (value.isEmpty) {
                            return 'Please enter the email';
                          } else if (!isValidate) {
                            return 'please enter valid email';
                          }
                        },
                        hintText: "Enter your Email",
                        textInputAction: TextInputAction.next,
                        label: "Email",
                        iconData: Icon(
                          EvaIcons.emailOutline,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                        onSubmitted: (value) {
                          _passwordFocusNode.requestFocus();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Enter the 6+ character long password';
                          }
                        },
                        focusNode: _passwordFocusNode,
                        hintText: "Enter your Password",
                        label: "Password",
                        iconData: Icon(
                          EvaIcons.lockOutline,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        onSubmitted: (value) {
                          password = value;
                        },
                        obscuredText: true,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value.length < 6) {
                            return 'enter the 6+ character long password';
                          } else if (password != confirmPassword) {
                            return 'password does not match';
                          }
                        },
                        hintText: "Re-enter your Password",
                        label: "Confirm Password",
                        iconData: Icon(
                          EvaIcons.lockOutline,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        onSubmitted: (value) {
                          confirmPassword = value;
                        },
                        obscuredText: true,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (widget._formKey.currentState.validate()) {
                            await _authServices
                                .registerUserWithEmailAndPass(email, password)
                                .then((dynamic user) {
                              if (user != null) {
                                Navigator.of(context).pop();
                                FireStoreMethods()
                                    .addUserToFireStore(user: user)
                                    .then((value) {
                                  Fluttertoast.showToast(msg: "ADDED");
                                });
                              }
                            });
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            Fluttertoast.showToast(msg: "ERROR OCCURRED");
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        text: "Continue",
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(175.0),
              ),
              Divider(
                thickness: 1.0,
                height: getProportionateScreenHeight(2.0),
                color: Colors.black26,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18.0),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginPage.routeName,
                      );
                    },
                    child: Text(
                      "Go to Login",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(18.0),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
