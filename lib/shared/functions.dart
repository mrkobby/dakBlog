import 'package:dakblog/shared/constants.dart';
import 'package:flutter/material.dart';

// Call SnackBar
void showSnackbar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ),
  );
}

void showBottomPanel(BuildContext context, Widget widget) {
  showModalBottomSheet(
    backgroundColor: kDefaultThemeColorLight,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: widget,
            ),
            Text('Slide down to close'),
            Text(
              '↓',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      );
    },
  );
}

void onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: kDefaultThemeColorLight,
        insetAnimationDuration: Duration(minutes: 3),
        child: Container(
          height: 100,
          width: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kDefaultThemeColorDark),
                strokeWidth: 3.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("Hold on.."),
            ],
          ),
        ),
      );
    },
  );
  Future.delayed(new Duration(seconds: 1), () {
    Navigator.pop(context);
  });
}
