import 'package:dakblog/models/user.dart';
import 'package:dakblog/services/auth.dart';
import 'package:dakblog/services/database.dart';
import 'package:flutter/material.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //obj of authentication Service Class
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.userID).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                kSizedBoxCol20,
                CircleAvatar(
                  backgroundColor: kDefaultThemeColorDark,
                  radius: 60.0,
                ),
                kSizedBoxCol10,
                Divider(
                  color: kDefaultThemeColorDark,
                ),
                Center(
                  child: Text(
                    '${userData.fullname}',
                    style: kDefaultTextTitleStyle.copyWith(
                        color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w800),
                  ),
                ),
                kSizedBoxCol10,
                Center(
                  child: Text(
                    '${userData.email}',
                    style: kDefaultTextTitleStyle.copyWith(
                        color: kDefaultThemeColorDark, fontSize: 16.0),
                  ),
                ),
                kSizedBoxCol10,
                Divider(
                  color: kDefaultThemeColorDark,
                ),
                kSizedBoxCol30,
                FlatButton(
                  child: ListTile(
                    title: Text("Update account info"),
                    subtitle: Text('You can change you name and email'),
                    leading: Icon(Icons.security),
                    trailing: Icon(Icons.info),
                  ),
                  onPressed: () {},
                ),
                kSizedBoxCol30,
                FlatButton(
                  child: ListTile(
                    title: Text(
                      "Logout",
                      style: kAuthErrorTextStyle.copyWith(fontSize: 18.0),
                    ),
                    leading: Icon(
                      Icons.power_settings_new,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () async {
                    await _authService.signoutUser();
                  },
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
