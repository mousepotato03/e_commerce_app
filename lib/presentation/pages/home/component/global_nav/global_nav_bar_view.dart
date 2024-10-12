import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';

class GlobalNavBarView extends StatelessWidget {
  final List<Menu> menus;
  final MallType mallType;

  const GlobalNavBarView(this.mallType, this.menus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) => Column(
            children: [
              Text("mallType: ${mallType}"),
              Text("menu title: ${menus[index].title}"),
            ],
          ),
        ),
      ),
    );
  }
}
