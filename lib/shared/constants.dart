import 'package:flutter/material.dart';

const Color kDefaultThemeColorDark = Color(0xff243665);
const Color kDefaultThemeColorLight = Color(0xff8BD8BD);

const TextStyle kAuthenticationTextTitleStyle = TextStyle(
    color: kDefaultThemeColorDark, fontSize: 24.0, fontWeight: FontWeight.w900);
const TextStyle kDefaultTextTitleStyle = TextStyle(
    color: kDefaultThemeColorDark, fontSize: 20.0, fontWeight: FontWeight.w600);
const TextStyle kAuthErrorTextStyle =
    TextStyle(color: Colors.red, fontSize: 14.0,);

const SizedBox kSizedBoxCol10 = SizedBox(height: 10.0);
const SizedBox kSizedBoxCol20 = SizedBox(height: 20.0);
const SizedBox kSizedBoxCol30 = SizedBox(height: 30.0);

// Auth TextFields
const InputDecoration kAuthEamilTextFieldDecoration = InputDecoration(
  hintText: 'Email',
  hintStyle: TextStyle(color: Colors.black38),
  icon: Icon(
    Icons.email,
    color: kDefaultThemeColorDark,
  ),
);
const InputDecoration kAuthPasswordTextFieldDecoration = InputDecoration(
  hintText: 'Password',
  hintStyle: TextStyle(color: Colors.black38),
  icon: Icon(
    Icons.vpn_key,
    color: kDefaultThemeColorDark,
  ),
);
const InputDecoration kAuthStringTextFieldDecoration = InputDecoration(
  hintText: 'Full Name',
  hintStyle: TextStyle(color: Colors.black38),
  icon: Icon(
    Icons.person,
    color: kDefaultThemeColorDark,
  ),
);

// Blog TextFields
const InputDecoration kBlogTextFieldDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.black38),
  fillColor: Colors.white38,
  filled: true
);