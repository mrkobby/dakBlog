import 'package:dakblog/models/user.dart';
import 'package:dakblog/services/database.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogFeed extends StatefulWidget {
  @override
  _BlogFeedState createState() => _BlogFeedState();
}

class _BlogFeedState extends State<BlogFeed> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.userID).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return ListView(
              children: <Widget>[
                BlogPost(userData: userData, isSaved: _isSaved),
                BlogPost(userData: userData, isSaved: _isSaved),
                BlogPost(userData: userData, isSaved: _isSaved),
                BlogPost(userData: userData, isSaved: _isSaved),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}

class BlogPost extends StatelessWidget {
  const BlogPost({
    @required this.userData,
    @required bool isSaved,
  }) : _isSaved = isSaved;

  final UserData userData;
  final bool _isSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey[50]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: kDefaultThemeColorDark,
                radius: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${userData.fullname}'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('12 01 2020', style: TextStyle(fontSize: 12.0, color: Colors.black54),),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => showSnackbar(context, 'Post Options'),
              )
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('Why beans is important Why beans is important',
                    style: TextStyle(fontSize: 22.0, color: kDefaultThemeColorDark)),
                Divider(
                  color: Colors.blueGrey,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28.0,
                icon: Icon(Icons.favorite_border),
                onPressed: () => showSnackbar(context, 'Like'),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28.0,
                icon: Icon(Icons.send),
                onPressed: () => showSnackbar(context, 'Share'),
              ),
              Spacer(),
              Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28.0,
                icon: _isSaved
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border),
                onPressed: () => showSnackbar(context, 'Bookmark'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
