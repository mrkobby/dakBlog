import 'package:dakblog/screens/home/add_edit_blog.dart';
import 'package:dakblog/screens/home/blog_feed.dart';
import 'package:dakblog/screens/home/profile.dart';
import 'package:dakblog/screens/home/settings.dart';
import 'package:flutter/material.dart';
import 'package:dakblog/shared/constants.dart';
import 'package:intl/intl.dart' show DateFormat;

class HomePageRouter extends StatefulWidget {
  @override
  _HomePageRouterState createState() => _HomePageRouterState();
}

class _HomePageRouterState extends State<HomePageRouter> {
  String formattedDate = DateFormat.yMMMMEEEEd().format(DateTime.now());

  int selectedIndex = 0;
  final widgetOptions = <StatefulWidget>[
    BlogFeed(),
    AddEditBlog(),
    Profile(),
    Settings(),
  ];

  // double _lastFeedScrollOffset = 0;
  // ScrollController _scrollController;
  // void _scrollToTop() {
  //   if (_scrollController == null) {
  //     return;
  //   }
  //   _scrollController.animateTo(
  //     0.0,
  //     duration: Duration(milliseconds: 250),
  //     curve: Curves.decelerate,
  //   );
  // }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDefaultThemeColorLight,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: kDefaultThemeColorLight,
            elevation: 1.0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: AssetImage('assets/logos/dakblog_icon.png'),
                        height: 36.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '$formattedDate',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12.0),
                        ),
                        Text(
                          'dakBlog',
                          style: TextStyle(
                            color: kDefaultThemeColorDark,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          backgroundColor: kDefaultThemeColorDark,
                          radius: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onItemTapped,
          backgroundColor: kDefaultThemeColorLight,
          elevation: 0.0,
          currentIndex: selectedIndex,
          fixedColor: kDefaultThemeColorDark,
          unselectedItemColor: Colors.blueGrey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: BottomBarIcon(
                  icon: Icons.home,
                ),
                title: Text('Home'),
                backgroundColor: kDefaultThemeColorLight),
            BottomNavigationBarItem(
                icon: BottomBarIcon(
                  icon: Icons.edit,
                ),
                title: Text('Add/Edit'),
                backgroundColor: kDefaultThemeColorLight),
            BottomNavigationBarItem(
                icon: BottomBarIcon(
                  icon: Icons.person,
                ),
                title: Text('Profile'),
                backgroundColor: kDefaultThemeColorLight),
            BottomNavigationBarItem(
                icon: BottomBarIcon(
                  icon: Icons.settings,
                ),
                title: Text('Settings'),
                backgroundColor: kDefaultThemeColorLight),
          ],
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final IconData icon;
  const BottomBarIcon({this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 32.0,
    );
  }
}
