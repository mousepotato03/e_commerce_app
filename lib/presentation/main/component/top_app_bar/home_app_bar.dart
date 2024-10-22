import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant.dart';
import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_app_bar.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../../routes/route_path.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: state.theme.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(CustomAppBarTheme.tabBarRadius)),
                  color: state.theme.containerColor,
                ),
                child: SizedBox(
                  height: 28,
                  child: DefaultTabController(
                    initialIndex: state.index,
                    length: MallType.values.length,
                    child: TabBar(
                      onTap: (index) =>
                          context.read<MallTypeCubit>().changeIndex(index),
                      labelColor: state.theme.labelColor,
                      labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: state.theme.unselectedLabelColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.labelLarge.bold,
                      tabs: List.generate(
                        MallType.values.length,
                        (index) => Tab(text: MallType.values[index].toName),
                      ),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: state.theme.indicatorColor,
                      ),
                      splashBorderRadius: BorderRadius.all(
                          Radius.circular(CustomAppBarTheme.tabBarRadius)),
                    ),
                  ),
                ),
              ),
              leadingWidth: 86,
              actions: [
                SvgIconButton(
                  icon: AppIcons.location,
                  color: state.theme.iconColor,
                  onPressed: null,
                ),
                Stack(
                  children: [
                    SvgIconButton(
                      icon: AppIcons.cart,
                      color: state.theme.iconColor,
                      onPressed: () => context.push(RoutePath.cartList),
                    ),
                    Positioned(
                      top: 2,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.theme.badgeBgColor,
                          shape: BoxShape.circle,
                        ),
                        width: 13,
                        height: 13,
                        child: Center(
                          child: Text(
                            '${context.watch<CartListBloc>().state.cartList.length}',
                            style: TextStyle(
                              color: state.theme.badgeNumColor,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              leading: SvgIconButton(
                icon: AppIcons.mainLogo,
                padding: 8,
                color: state.theme.logoColor,
                onPressed: null,
              )),
        );
      },
    );
  }
}
