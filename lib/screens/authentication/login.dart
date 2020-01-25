import 'package:dakblog/services/auth.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  final Function toggleAuthenticationView;
  Login({this.toggleAuthenticationView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //obj of authentication Service Class
  final AuthService _authService = AuthService();
  // formkey variable to validate form
  final _formKey = GlobalKey<FormState>();
  // user credentials variables
  String userEmail = '';
  String userPassword = '';
  // error message variable
  String errorMsg = '';

  //boolean variable for screen modal loader
  bool showModalLoader = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showModalLoader,
      color: kDefaultThemeColorDark,
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kDefaultThemeColorDark),
        strokeWidth: 3.0,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/bg/login_bg.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                  decoration: BoxDecoration(
                    color: kDefaultThemeColorLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Text(
                          'Sign in to Continue',
                          style: kAuthenticationTextTitleStyle,
                          textAlign: TextAlign.center,
                        ),
                        // Divider(
                        //   color: kDefaultThemeColorDark,
                        // ),
                        kSizedBoxCol20,
                        Center(
                          child: Text(errorMsg, style: kAuthErrorTextStyle),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your email address'
                              : null,
                          decoration: kAuthEamilTextFieldDecoration,
                          onChanged: (value) => userEmail = value,
                        ),
                        kSizedBoxCol30,
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          obscureText: true,
                          validator: (val) =>
                              val.isEmpty ? 'Please enter your password' : null,
                          decoration: kAuthPasswordTextFieldDecoration,
                          onChanged: (value) => userPassword = value,
                        ),
                        kSizedBoxCol30,
                        RaisedButton(
                          color: kDefaultThemeColorDark,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => showModalLoader = true);
                              dynamic result =
                                  await _authService.loginWithEmailAndPassword(
                                      userEmail, userPassword);
                              if (result == null) {
                                setState(() {
                                  showModalLoader = false;
                                  errorMsg =
                                      'Could not Sign in. Please check credentials';
                                });
                              }
                            }
                          },
                        ),
                        kSizedBoxCol30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              onTap: () => widget.toggleAuthenticationView(),
                              child: Text(
                                'Create an Account',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
