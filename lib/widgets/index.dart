import 'elements/index.dart' as elements;

class WidgetDemoList {
  WidgetDemoList();

  List getDemos() {
    List result = [];
    result.addAll(elements.getWidgets());
    return result;
  }
}