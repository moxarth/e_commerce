import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/screens/forgot_password_page.dart';
import 'package:manan_mobile/screens/register_page.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'package:manan_mobile/services/firestore_methods.dart';
import 'package:manan_mobile/size_config.dart';
import 'package:manan_mobile/widgets/custom_button.dart';
import 'package:manan_mobile/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Sign In",
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
  String email = '', password = '';
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
                "Welcome Back",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(35),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Text(
                "sign in with email and password or \n with a social account",
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
                        hintText: "Enter the Email",
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
                        hintText: "Enter the Password",
                        label: "Password",
                        iconData: Icon(
                          EvaIcons.lockOutline,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        obscuredText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isForgetPasswordChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isForgetPasswordChecked = value;
                                  });
                                },
                              ),
                              Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (widget._formKey.currentState.validate()) {
                            await _authServices.signInWithEmailAndPass(
                                email, password);
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        text: "Login",
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(110.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialAccountButton(
                    imageUrl: "assets/images/google.png",
                    onTap: () async {
                      await _authServices.googleSignIn().then((user) {
                        if (user != null) {
                          FireStoreMethods().addUserToFireStore(user: user);
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20.0),
                  ),
                  CustomSocialAccountButton(
                    imageUrl: "assets/images/facebook.png",
                    onTap: () {
                      Fluttertoast.showToast(msg: "Facebook");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10.0),
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
                    "Don't have any account? ",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18.0),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    child: Text(
                      "Create New",
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

class CustomSocialAccountButton extends StatelessWidget {
  final Function onTap;
  final String imageUrl;

  CustomSocialAccountButton({this.onTap, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getProportionateScreenHeight(80.0),
        width: getProportionateScreenWidth(85.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Image.asset(
          imageUrl,
          width: getProportionateScreenWidth(70.0),
          height: getProportionateScreenHeight(50.0),
        ),
      ),
    );
  }
}
