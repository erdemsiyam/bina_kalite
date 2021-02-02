import 'package:flutter/material.dart';

class IconPartWidget extends StatelessWidget {
  IconData iconData;
  IconPartWidget({@required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          // (_pageViews[_currentPage] as IPageViewSelection)
          //     .iconData,
          size: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
