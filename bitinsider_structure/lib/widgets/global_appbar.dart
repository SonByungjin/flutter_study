import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  List<String> tabs;
  String appTitle;
  GlobalAppBar(this.tabs, this.appTitle);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(appTitle),
        bottom: tabs.length > 1 ? TabBar(
          tabs: tabs.map((e) => Text(e)).toList(),
        ) : null
    );
  }
}
