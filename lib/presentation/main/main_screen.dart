import 'package:e_commerce_app/presentation/main/utils/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import '../pages/user/user_page.dart';
import 'bloc/cart_bloc/cart_bloc.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_nav_cubit.dart';
import 'cubit/mall_type_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => BottomNavCubit()),
      BlocProvider(create: (_) => MallTypeCubit())
    ], child: const MainScreenView());
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          cartBottomSheet(context).whenComplete(()=> context.read<CartBloc>().add(CartClosed()));
        },
        listenWhen: (prev,cur)=> prev.status.isClose && cur.status.isOpen,
        child: BlocBuilder<BottomNavCubit, BottomNav>(
          builder: (_, state) {
            switch (state) {
              case BottomNav.home:
                return const HomePage();
              case BottomNav.category:
                return const CategoryPage();
              case BottomNav.search:
                return const SearchPage();
              case BottomNav.user:
                return const UserPage();
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: List.generate(
              BottomNav.values.length,
                  (index) =>
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(BottomNav.values[index].icon),
                    activeIcon:
                    SvgPicture.asset(BottomNav.values[index].activeIcon),
                    label: BottomNav.values[index].toName,
                  ),
            ),
          );
        },
      ),
    );
  }
}
