import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import 'CheckBox/index.dart' as CheckBox;
import 'Combination/index.dart' as Combination;
import 'TextField/index.dart' as TextField;

List<WidgetPoint> getWidgets = [
   WidgetPoint(
    name: 'CheckBox',
    routerName: CheckBox.Demo.routeName,
    buildRouter: (BuildContext context) => CheckBox.Demo(),
  ),

   WidgetPoint(
    name: 'Combination',
    routerName: Combination.Demo.routeName,
    buildRouter: (BuildContext context) => Combination.Demo(),
  ),

   WidgetPoint(
    name: 'TextField',
    routerName: TextField.Demo.routeName,
    buildRouter: (BuildContext context) => TextField.Demo(),
  ),
];
