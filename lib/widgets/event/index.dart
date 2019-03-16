import 'package:flutter/material.dart';
import '../../model/widget.dart';

import 'Pointer/index.dart' as Pointer;
import 'GestureDetector/Scale/index.dart' as Scale;

List<WidgetPoint> getWidgets = [
  WidgetPoint(
    name: 'Pointer',
    routerName: Pointer.Demo.routeName,
    buildRouter: (BuildContext context) => Pointer.Demo(),
  ),
  WidgetPoint(
    name: 'GestureDetector',
    routerName: Scale.Demo.routeName,
    buildRouter: (BuildContext context) => Scale.Demo(),
  ),
];
