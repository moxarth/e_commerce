import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manan_mobile/screens/login_page.dart';
import 'package:manan_mobile/services/authentication_methods.dart';
import 'package:manan_mobile/services/firestore_methods.dart';
import 'package:manan_mobile/size_config.dart';
import 'package:manan_mobile/widgets/custom_button.dart';
import 'package:manan_mobile/widgets/custom_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  static String routeName = '/forgot_password';

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Forgot Password",
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
  String email = '';
  bool isLoading;

  showAlertDialog(BuildContext context) {
    // set up the buttons
    // Widget cancelButton = TextButton(
    //   child: Text("Cancel"),
    //   onPressed:  () {
    //     Navigator.pop(context);
    //   },
    // );
    Widget continueButton = TextButton(
      child: Text("Back To Login"),
      onPressed:  () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Email Sent"),
      content: Text("Email has been sent to $email, reset the password and back to login"),
      actions: [
        // cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(25),),
              Text(
                "Enter Your Email",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(35),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(55),
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
                        height: getProportionateScreenHeight(35),
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
                      ),
                      SizedBox(height: getProportionateScreenHeight(30.0),),
                      CustomButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (widget._formKey.currentState.validate()) {
                            _authServices.forgotPasswordEmailSender(email).then((value){
                              showAlertDialog(context);
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
                height: getProportionateScreenHeight(15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
