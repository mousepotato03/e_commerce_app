import 'domain/usecase/display/display.usecase.dart';
import 'domain/usecase/display/menu/get_menus_usecase.dart';
import 'presentation/main/cubit/mall_type_cubit.dart';
import 'presentation/routes/routes.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme_data.dart';
import 'service_locator.dart';

void main() async{
  setLocator();
  final menus = await locator<DisplayUsecase>()
      .excute(usecase: GetMenusUsecase(mallType: MallType.market));
  print(menus);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: CustomThemeData.themeData,
    );
  }
}
