class WidgetEntry {
  final List<WidgetEntry> children;

  int id = 0;

  //组件英文名
  String name = "";

  //组件中文名
  String cnName = "";

  //组件截图
  String? image = "";

  // 路由地址
  String routerName = "";

  //组件markdown 文档
  String doc = "";

  //组件 demo ，多个以 , 分割
  String demo = "";

  //类目 id
  int catId = 0;

  final WidgetEntry widget;

  WidgetEntry(this.name, this.widget, [this.children = const <WidgetEntry>[]]);
}
