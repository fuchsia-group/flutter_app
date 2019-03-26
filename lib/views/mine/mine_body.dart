import 'package:flutter/material.dart';
import 'package:flutter_app/components/option_item.dart';

class MineBody extends StatefulWidget {

  final List getItem = [
    {"leading": Icons.list,"title": "每日签到","trailing":"签到送优惠券"}
  ];

  @override
  createState() => _MineBodyState();
}

class _MineBodyState extends State<MineBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OptionItem(
          leading: Icons.list,
          title: "每日签到",
          trailing: "签到送优惠券",
          trailingIcon: Icons.arrow_forward_ios,
        ),
        Divider(height: 1),
        OptionItem(
          leading: Icons.border_outer,
          title: "账单",
          trailing: "",
          trailingIcon: Icons.arrow_forward_ios,
        ),
        Divider(height: 1),
        OptionItem(
          leading: Icons.add_shopping_cart,
          title: "车辆管理",
          trailing: "3辆",
          trailingIcon: Icons.arrow_forward_ios,
        ),
        Divider(height: 1),
        OptionItem(
          leading: Icons.account_balance_wallet,
          title: "钱包",
          trailing: "",
          trailingIcon: Icons.arrow_forward_ios,
        ),
      ],
    );
  }
}
