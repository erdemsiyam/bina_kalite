import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

class Pv01Konum extends StatefulWidget implements IPageView {
  @override
  Icon icon;
  @override
  String title;
  @override
  Dot dot;
  @override
  double shortestSide;

  Pv01Konum(this.shortestSide);
  @override
  _Pv01KonumState createState() => _Pv01KonumState();
}

class _Pv01KonumState extends State<Pv01Konum> with Responsive {
  @override
  Widget build(BuildContext context) {
    deviceType = widget.shortestSide;
    return Container();
  }
}
