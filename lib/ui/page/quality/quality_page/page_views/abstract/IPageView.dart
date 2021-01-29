import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/IResponsive.dart';

abstract class IPageView implements IResponsive {
  IconData iconData;
  String title;
  Dot dot;
}
