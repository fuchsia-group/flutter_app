import 'package:flutter/material.dart';

import '../widgets/index.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetDemo = "/widget-demo";
  static String codeView = "/code-view";
  static String webViewPage = "/web-view-page";

  static void configureRoutes(Router router) {
    List widgetDemosList = WidgetDemoList().getDemos();

    // router.notFoundHandler = new Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   print("ROUTE WAS NOT FOUND !!!");
    // });
    // // router.define(root, handler: rootHandler);

    // // router.define('/category/:type', categoryHandler);
    // router.define('/category/error/404', handler: widgetNotFoundHandler);
  }
}
