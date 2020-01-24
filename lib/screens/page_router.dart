import 'package:dakblog/models/user.dart';
import 'package:dakblog/screens/authentication/authentication_page_router.dart';
import 'package:dakblog/screens/home/home_page_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    //return either Home or Authenticate widget
    if (user == null) {
      return AuthenticationPageRouter();
    }else{
      return HomePageRouter();
    }
  }
}