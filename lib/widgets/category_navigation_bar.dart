import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/constants.dart';

import '../models/categories.dart';

class CategoryNavigationBar extends StatefulWidget {
  final int initialIndex;
  final List<Categories> pages;
  final void Function(int tabIndex)? onTabChanged;
  const CategoryNavigationBar({
    Key? key,
    required this.initialIndex,
    required this.pages,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  State<CategoryNavigationBar> createState() => _CategoryNavigationBarState();
}

class _CategoryNavigationBarState extends State<CategoryNavigationBar>
    with TickerProviderStateMixin {
  late List<Widget> _tabs;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
      length: widget.pages.length,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabs = widget.pages
        .map((page) => _buildTabItem(
              Text(page.name.toUpperCase()),
            ))
        .toList();

    return TabBar(
      controller: _tabController,
      labelColor: primaryColor,
      unselectedLabelColor: Colors.grey,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      tabs: _tabs,
      onTap: (value) {
        if (widget.onTabChanged != null) {
          widget.onTabChanged!(value);
        }
      },
    );
  }

  Widget _buildTabItem(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}
