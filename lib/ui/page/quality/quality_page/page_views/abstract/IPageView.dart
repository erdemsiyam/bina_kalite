import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/utils/IResponsive.dart';

abstract class IPageView implements IResponsive {
  IconData iconData;
  String title;
  SeenState seenState;
  bool checkAnswer();
}
