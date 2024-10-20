import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions.dart';
import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../../../domain/model/display/product_info/product_info.model.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../component/top_app_bar/widgets/svg_icon_button.dart';

const double _counterHeight = 36;

const double _counterWidth = 96;

const double _iconSize = 16;

const double _iconPadding = 8;

class CartPriceInfo extends StatelessWidget {
  final ProductInfo productInfo;
  final int quantity;

  const CartPriceInfo(
      {super.key, required this.productInfo, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Text(
            productInfo.title,
            style: textTheme.labelLarge
                ?.copyWith(color: colorScheme.contentPrimary),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    productInfo.price.toWon(),
                    style: textTheme.titleMedium?.priceCopyWith(),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    productInfo.originalPrice.toWon(),
                    style: textTheme.titleSmall?.originalPriceCopyWith(),
                  ),
                ],
              ),
              Container(
                width: _counterWidth,
                height: _counterHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.outline),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgIconButton(
                      icon: AppIcons.subtract,
                      color: quantity != 1
                          ? colorScheme.contentFourth
                          : colorScheme.contentPrimary,
                      padding: _iconPadding,
                      onPressed: () => context.read<CartBloc>().add(CartQuantityDecreased()),
                    ),
                    Text(
                      "$quantity",
                      style: textTheme.labelLarge.semiBold
                          ?.copyWith(color: colorScheme.contentPrimary),
                    ),
                    SvgIconButton(
                      icon: AppIcons.add,
                      color: colorScheme.contentPrimary,
                      padding: _iconPadding,
                      onPressed: () => context.read<CartBloc>().add(CartQuantityIncreased()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
