import 'package:e_commerce_app/presentation/main/bloc/user_bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/theme/theme_data.dart';
import 'data/entity/cart/cart.entity.dart';
import 'data/entity/product_info/product_info.entity.dart';
import 'data/entity/view_module/view_module.entity.dart';
import 'data/entity/view_module_list/view_module_list.entity.dart';
import 'dependency_injection.dart';
import 'firebase_options.dart';
import 'presentation/main/bloc/cart_bloc/cart_bloc.dart';
import 'presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'presentation/routes/routes.dart';

void main() async {
  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProductInfoEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(ViewModuleEntityAdapter());
  Hive.registerAdapter(ViewModuleListEntityAdapter());


  configureDependencies();

  //Kakao login
  KakaoSdk.init(nativeAppKey: "8b6359fda443bcf77f37fc62c6fc2e43");

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UserBloc>()..add(UserLoginWithToken()),
        ),
        BlocProvider(
          create: (_) => getIt<CartBloc>()..add(CartInitialized()),
        ),
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
