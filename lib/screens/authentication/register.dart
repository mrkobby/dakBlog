import 'package:dakblog/services/auth.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  final Function toggleAuthenticationView;
  Register({this.toggleAuthenticationView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //obj of authentication Service Class
  final AuthService _authService = AuthService();
  // formkey variable to validate form
  final _formKey = GlobalKey<FormState>();
  // user credentials variables
  String userFullname = '';
  String userEmail = '';
  String userPassword = '';
  String userConfirmPassword = '';
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
        backgroundColor: kDefaultThemeColorDark,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              kSizedBoxCol20,
              Flexible(
                flex: 10,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Text('Create an Account',
                            style: kAuthenticationTextTitleStyle),
                      ),
                      // Divider(
                      //   color: kDefaultThemeColorDark,
                      // ),
                      Expanded(
                        flex: 6,
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              kSizedBoxCol20,
                              Center(
                                child:
                                    Text(errorMsg, style: kAuthErrorTextStyle),
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter your full name'
                                    : null,
                                decoration: kAuthStringTextFieldDecoration,
                                onChanged: (value) => userFullname = value,
                              ),
                              kSizedBoxCol30,
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
                                validator: (val) => val.length < 8
                                    ? 'Please enter a password 8+ characters long'
                                    : null,
                                decoration: kAuthPasswordTextFieldDecoration,
                                onChanged: (value) => userPassword = value,
                              ),
                              kSizedBoxCol30,
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                obscureText: true,
                                validator: (val) => val.isEmpty
                                    ? 'Please confirm your password'
                                    : null,
                                decoration: kAuthPasswordTextFieldDecoration
                                    .copyWith(hintText: 'Confirm Password'),
                                onChanged: (value) =>
                                    userConfirmPassword = value,
                              ),
                              kSizedBoxCol30,
                              RaisedButton(
                                color: kDefaultThemeColorDark,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (userPassword == userConfirmPassword) {
                                      setState(() => showModalLoader = true);
                                      dynamic result = await _authService
                                          .registerWithEmailAndPassword(
                                              userEmail, userPassword, userFullname);
                                      if (result == null) {
                                        setState(() {
                                          showModalLoader = false;
                                          errorMsg =
                                              'Please provide a valid email address';
                                        });
                                      }
                                    } else {
                                      setState(() => errorMsg =
                                          'Your passwords do not match');
                                      return;
                                    }
                                  }
                                },
                              ),
                              kSizedBoxCol20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        widget.toggleAuthenticationView(),
                                    child: Text(
                                      'Sign in',
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
