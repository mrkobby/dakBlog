import 'package:flutter/material.dart';
import 'package:dakblog/shared/constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Settings',
            style: kDefaultTextTitleStyle,
            textAlign: TextAlign.center,
          ),
          kSizedBoxCol20,
          FlatButton(
            child: ListTile(
              title: Text("Account Settings"),
              subtitle: Text('Change account name, bio, etc'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.launch),
            ),
            onPressed: () {},
          ),
          kSizedBoxCol10,
          FlatButton(
            child: ListTile(
              title: Text("Privacy Settings"),
              subtitle: Text('Choose who to view your blog'),
              leading: Icon(Icons.security),
              trailing: Icon(Icons.launch),
            ),
            onPressed: () {},
          ),
          kSizedBoxCol10,
          FlatButton(
            child: ListTile(
              title: Text("Change Password"),
              subtitle: Text('You can reset your password'),
              leading: Icon(Icons.vpn_key),
              trailing: Icon(Icons.launch),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
