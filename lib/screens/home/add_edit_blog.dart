import 'package:dakblog/shared/constants.dart';
import 'package:flutter/material.dart';

class AddEditBlog extends StatefulWidget {
  @override
  _AddEditBlogState createState() => _AddEditBlogState();
}

class _AddEditBlogState extends State<AddEditBlog> {
  // formkey variable to validate form
  final _formKey = GlobalKey<FormState>();
  // user credentials variables
  String blogTitle = '';
  String blogBody = '';
  // error message variable
  String errorMsg = '';

  //boolean variable for screen modal loader
  bool showModalLoader = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add/Edit',
            style: kDefaultTextTitleStyle,
            textAlign: TextAlign.center,
          ),
          kSizedBoxCol10,
          Flexible(
            child: Container(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    kSizedBoxCol20,
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      validator: (val) => val.isEmpty
                          ? 'Please enter blog title'
                          : null,
                      decoration: kBlogTextFieldDecoration.copyWith(hintText: 'Title'),
                      onChanged: (value) => blogTitle = value,
                    ),
                    kSizedBoxCol20,
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      maxLines: 8,
                      cursorColor: Colors.black,
                      validator: (val) => val.isEmpty
                          ? 'Blog body not filled'
                          : null,
                      decoration: kBlogTextFieldDecoration.copyWith(hintText: 'Body'),
                      onChanged: (value) => blogBody = value,
                    ),
                    kSizedBoxCol30,
                    RaisedButton(
                      color: kDefaultThemeColorDark,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// TextFormField(
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 6,
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//                 controller: bodyController,
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(),
//                 ),
//               ),

// Container(
//       color: Colors.red,
//       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//       child: Column(
//         children: <Widget>[
//           Form(
//             key: _formKey,
//             child: ListView(
//               children: <Widget>[
//                 Text(
//                   'Sign in to Continue',
//                   style: kAuthenticationTextTitleStyle,
//                   textAlign: TextAlign.center,
//                 ),
//                 // Divider(
//                 //   color: kDefaultThemeColorDark,
//                 // ),
//                 kSizedBoxCol20,
//                 Center(
//                   child: Text(errorMsg, style: kAuthErrorTextStyle),
//                 ),
//                 TextFormField(
//                   style: TextStyle(color: Colors.black),
//                   cursorColor: Colors.black,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (val) => val.isEmpty
//                       ? 'Please enter your email address'
//                       : null,
//                   decoration: kAuthEamilTextFieldDecoration,
//                   onChanged: (value) => userEmail = value,
//                 ),
//                 kSizedBoxCol30,
//                 TextFormField(
//                   style: TextStyle(color: Colors.black),
//                   cursorColor: Colors.black,
//                   obscureText: true,
//                   validator: (val) =>
//                       val.isEmpty ? 'Please enter your password' : null,
//                   decoration: kAuthPasswordTextFieldDecoration,
//                   onChanged: (value) => userPassword = value,
//                 ),
//                 kSizedBoxCol30,
//                 RaisedButton(
//                   color: kDefaultThemeColorDark,
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(
//                           fontSize: 18.0, color: Colors.white),
//                     ),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {}
//                   },
//                 ),
//                 kSizedBoxCol30,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
