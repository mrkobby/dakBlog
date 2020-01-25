import 'package:dakblog/models/user.dart';
import 'package:dakblog/services/database.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:dakblog/shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String _fullname;
  // error message variable
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.userID).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update account info',
                    style: kDefaultTextTitleStyle,
                  ),
                  kSizedBoxCol20,
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      initialValue: userData.fullname,
                      autofocus: true,
                      cursorColor: Colors.black,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter your fullname' : null,
                      decoration: InputDecoration(
                        hintText: 'Fullame',
                      ),
                      onChanged: (value) {
                        setState(() => _fullname = value);
                      },
                    ),
                  ),
                  kSizedBoxCol20,
                  kSizedBoxCol20,
                  Flexible(
                    flex: 2,
                    child: RaisedButton(
                      color: kDefaultThemeColorDark,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          onLoading(context);
                          // dynamic result =
                              await DatabaseService(uid: user.userID)
                                  .updateAccountInfo(
                            _fullname ?? userData.fullname,
                          );
                          // if (result == null) {
                          //   print(result);
                          //   setState(() {
                          //     errorMsg =
                          //         'Could not update account info. Please try again';
                          //   });
                          // }
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  kSizedBoxCol10,
                  Text(errorMsg,
                      textAlign: TextAlign.center, style: kAuthErrorTextStyle),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
