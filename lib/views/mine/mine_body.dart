import 'package:flutter/material.dart';
import 'package:flutter_app/components/option_item.dart';

class MineBody extends StatefulWidget {
  @override
  createState() => _MineBodyState();
}

class _MineBodyState extends State<MineBody> {
  final List getItem = [
    {
      "type": "1",
      "leading": Icons.list,
      "title": "每日签到",
      "trailing": "签到送优惠券",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.border_outer,
      "title": "账单",
      "trailing": "",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.shopping_cart,
      "title": "车辆管理",
      "trailing": "3辆",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.account_balance_wallet,
      "title": "钱包",
      "trailing": "",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.help,
      "title": "使用帮助",
      "trailing": "",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.child_friendly,
      "title": "邀请好友",
      "trailing": "",
      "trailingIcon": Icons.arrow_forward_ios
    },
    {
      "type": "1",
      "leading": Icons.settings,
      "title": "设置",
      "trailing": "",
      "trailingIcon": Icons.arrow_forward_ios
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: getItem.map((item) => _buildItem(item)).toList());
  }

  Widget _buildItem(item) {
    return OptionItem(
      leading: item["leading"],
      title: item["title"],
      trailing: item["trailing"],
      trailingIcon: item["trailingIcon"],
    );
  }
}
