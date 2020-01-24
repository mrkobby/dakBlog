import 'package:dakblog/models/user.dart';
import 'package:dakblog/screens/page_router.dart';
import 'package:dakblog/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// COLORS
// light - 8BD8BD
// dark - 243665

void main() => runApp(DakBlogApp());

class DakBlogApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      child: MaterialApp(
        title: 'dakBlog',
        theme: ThemeData(
        primaryColor: Color(0xff243665),
      ),
        home: PageRouter(),
      ),
      value: AuthService().user,
    );
  }
}
