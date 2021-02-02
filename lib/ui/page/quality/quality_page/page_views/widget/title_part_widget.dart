import 'package:flutter/material.dart';

class TitlePartWidget extends StatelessWidget {
  String title;
  TitlePartWidget({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      child: Text(
        title,
        // (_pageViews[_currentPage] as IPageViewSelection).title,
        style: TextStyle(
          fontSize: 26,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}
