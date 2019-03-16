import 'package:flutter/material.dart';
import '../../model/widget.dart';

import 'InheritedWidget/index.dart' as InheriedWidget;
import 'Theme/index.dart' as Theme;
import 'WillPopScope/index.dart' as WillPopScope;

List<WidgetPoint> getWidgets = [
  WidgetPoint(
    name: 'InheriedWidget',
    routerName: InheriedWidget.Demo.routeName,
    buildRouter: (BuildContext context) => InheriedWidget.Demo(),
  ),
  WidgetPoint(
    name: 'Theme',
    routerName: Theme.Demo.routeName,
    buildRouter: (BuildContext context) => Theme.Demo(),
  ),
  WidgetPoint(
    name: 'WillPopScope',
    routerName: WillPopScope.Demo.routeName,
    buildRouter: (BuildContext context) => WillPopScope.Demo(),
  ),
];