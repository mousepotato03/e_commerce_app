import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant.dart';
import '../../../../../dependency_injection.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../bloc/view_modules_bloc/view_module_bloc.dart';
import '../view_module_list/view_module_list.dart';

class GlobalNavBarView extends StatelessWidget {
  final List<Menu> menus;
  final MallType mallType;

  const GlobalNavBarView(this.mallType, this.menus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(menus.length, (index) {
          final tabId = menus[index].tabId;
          return BlocProvider(
            create: (_) => getIt<ViewModuleBloc>()
              ..add(ViewModuleInitialized(tabId: tabId)),
            child: ViewModuleList(tabId: tabId),
          );
        }),
      ),
    );
  }
}
