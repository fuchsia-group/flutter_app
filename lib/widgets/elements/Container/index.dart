import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import 'ConstrainedBox/index.dart' as ConstrainedBox;
import 'DecoratedBox/index.dart' as DecoratedBox;
import 'Padding/index.dart' as Padding;

List<WidgetPoint> getWidgets = [
  WidgetPoint(
    name: 'ConstrainedBox',
    routerName: ConstrainedBox.Demo.routeName,
    buildRouter: (BuildContext context) => ConstrainedBox.Demo(),
  ),
  WidgetPoint(
    name: 'DecoratedBox',
    routerName: DecoratedBox.Demo.routeName,
    buildRouter: (BuildContext context) => DecoratedBox.Demo(),
  ),
  WidgetPoint(
    name: 'Padding',
    routerName: Padding.Demo.routeName,
    buildRouter: (BuildContext context) => Padding.Demo(),
  ),
];
