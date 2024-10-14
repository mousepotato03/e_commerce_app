import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../service_locator.dart';
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
          return BlocProvider(
            create: (_) => ViewModuleBloc(locator<DisplayUsecase>())
              ..add(ViewModuleInitialized(tabId: menus[index].tabId)),
            child: const ViewModuleList(),
          );
        }),
      ),
    );
  }
}


