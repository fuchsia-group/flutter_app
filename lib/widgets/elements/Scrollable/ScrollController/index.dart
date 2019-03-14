import 'package:flutter/material.dart';
import '../../../../model/widget.dart';

import 'Controller/index.dart' as Controller;
import 'Notification/index.dart' as Notification;

List<WidgetPoint> getWidgets = [
   WidgetPoint(
    name: 'Controller',
    routerName: Controller.Demo.routeName,
    buildRouter: (BuildContext context) => Controller.Demo(),
  ),
  WidgetPoint(
    name: 'Notification',
    routerName: Notification.Demo.routeName,
    buildRouter: (BuildContext context) => Notification.Demo(),
  ),
   
];
