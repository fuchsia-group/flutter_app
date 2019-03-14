import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import 'Image/index.dart' as Image;

List<WidgetPoint> getWidgets = [
   WidgetPoint(
    name: 'Image',
    routerName: Image.Demo.routeName,
    buildRouter: (BuildContext context) => Image.Demo(),
  ),
   
];
