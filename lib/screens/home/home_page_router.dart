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
  @override
  void dispose() {
    _disposeScrollController();
    super.dispose();
  }

  String formattedDate = DateFormat.yMMMMEEEEd().format(DateTime.now());

  int _selectedIndex = 0;
  double _lastFeedScrollOffset = 0;
  ScrollController _scrollController;

  // return page body
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        _scrollController =
            ScrollController(initialScrollOffset: _lastFeedScrollOffset);
        return BlogFeed(scrollController: _scrollController);
      case 1:
        _disposeScrollController();
        return AddEditBlog();
      case 2:
        _disposeScrollController();
        return Profile();
      default:
        _disposeScrollController();
        return Settings();
    }
  }

  // onpressed tapButton, update _selectedIndex or go-to blogfeed with scroll
  void _onTabTapped(BuildContext context, int index) {
    if (index == _selectedIndex) {
      _scrollToTop();
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  // Scroll function for blogfeed
  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  // Call this when changing the body that doesn't use a ScrollController.
  void _disposeScrollController() {
    if (_scrollController != null) {
      _lastFeedScrollOffset = _scrollController.offset;
      _scrollController.dispose();
      _scrollController = null;
    }
  }

  // draw bottom navigation bar buttons
  Widget _buildBottomNavigation() {
    const List<IconData> unselectedIcons = [
      Icons.home,
      Icons.edit,
      Icons.person,
      Icons.settings,
    ];
    const selecteedIcons = <IconData>[
      Icons.home,
      Icons.edit,
      Icons.person,
      Icons.settings,
    ];
    final bottomNaivgationItems = List.generate(4, (int i) {
      final iconData =
          _selectedIndex == i ? selecteedIcons[i] : unselectedIcons[i];
      return BottomNavigationBarItem(icon: Icon(iconData), title: Container());
    }).toList();

    return Builder(builder: (BuildContext context) {
      return BottomNavigationBar(
        backgroundColor: kDefaultThemeColorLight,
        iconSize: 32.0,
        type: BottomNavigationBarType.fixed,
        items: bottomNaivgationItems,
        currentIndex: _selectedIndex,
        onTap: (int i) => _onTabTapped(context, i),
      );
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
                      onTap: () => _onTabTapped(context, 0),
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
                          _selectedIndex = 2;
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
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigation(),
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
