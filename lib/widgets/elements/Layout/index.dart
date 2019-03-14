import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import 'Column/index.dart' as Column;
import 'Flex/index.dart' as Flex;
import 'Flow/index.dart' as Flow;
import 'Row/index.dart' as Row;
import 'Stack/index.dart' as Stack;
import 'Wrap/index.dart' as Wrap;

List<WidgetPoint> getWidgets = [
   WidgetPoint(
    name: 'Column',
    routerName: Column.Demo.routeName,
    buildRouter: (BuildContext context) => Column.Demo(),
  ),
   WidgetPoint(
    name: 'Flex',
    routerName: Flex.Demo.routeName,
    buildRouter: (BuildContext context) => Flex.Demo(),
  ),
   WidgetPoint(
    name: 'Flow',
    routerName: Flow.Demo.routeName,
    buildRouter: (BuildContext context) => Flow.Demo(),
  ),
   WidgetPoint(
    name: 'Row',
    routerName: Row.Demo.routeName,
    buildRouter: (BuildContext context) => Row.Demo(),
  ),
   WidgetPoint(
    name: 'Stack',
    routerName: Stack.Demo.routeName,
    buildRouter: (BuildContext context) => Stack.Demo(),
  ),
   WidgetPoint(
    name: 'Wrap',
    routerName: Wrap.Demo.routeName,
    buildRouter: (BuildContext context) => Wrap.Demo(),
  ),
];
