import 'package:dakblog/screens/authentication/login.dart';
import 'package:dakblog/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class AuthenticationPageRouter extends StatefulWidget {
  @override
  _AuthenticationPageRouterState createState() => _AuthenticationPageRouterState();
}

class _AuthenticationPageRouterState extends State<AuthenticationPageRouter> {
  bool showLoginPage = true;

  void toogleAuthView() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(toggleAuthenticationView: toogleAuthView,);
    }else{
      return Register(toggleAuthenticationView: toogleAuthView,);
    }
  }
}