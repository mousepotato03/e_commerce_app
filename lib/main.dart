import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/theme/theme_data.dart';
import 'data/entity/cart/cart.entity.dart';
import 'data/entity/product_info/product_info.entity.dart';
import 'dependency_injection.dart';
import 'presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'presentation/routes/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CartBloc>()..add(CartInitialized())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: CustomThemeData.themeData,
      ),
    );
  }
}
