import 'Container/index.dart' as Container;
import 'Form/index.dart' as Form;
import 'Layout/index.dart' as Layout;
import 'Media/index.dart' as Media;

List getWidgets() {
  List result = [];
  result.addAll(Container.getWidgets);
  result.addAll(Form.getWidgets);
  result.addAll(Layout.getWidgets);
  result.addAll(Media.getWidgets);
  return result;
}