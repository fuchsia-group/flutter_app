import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import 'CustomScrollView/index.dart' as CustomScrollView;

List<WidgetPoint> getWidgets = [
   WidgetPoint(
    name: 'Image',
    routerName: CustomScrollView.Demo.routeName,
    buildRouter: (BuildContext context) => CustomScrollView.Demo(),
  ),
   
];
