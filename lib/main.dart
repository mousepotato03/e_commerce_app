import 'package:e_commerce_app/presentation/main/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/theme/theme_data.dart';
import 'data/entity/cart/cart.entity.dart';
import 'data/entity/product_info/product_info.entity.dart';
import 'dependency_injection.dart';
import 'presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'presentation/routes/routes.dart';

void main() async {
  configureDependencies();

  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());

  //Kakao login
  KakaoSdk.init(nativeAppKey: "8b6359fda443bcf77f37fc62c6fc2e43");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<UserBloc>()..add(UserLoginWithToken())),
        BlocProvider(create: (_) => getIt<CartBloc>()..add(CartInitialized())),
        BlocProvider(
          create: (_) => getIt<CartListBloc>()..add(CartListInitialized()),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: CustomThemeData.themeData,
      ),
    );
  }
}
