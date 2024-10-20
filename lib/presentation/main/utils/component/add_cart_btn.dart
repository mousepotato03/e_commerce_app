import 'package:flutter/material.dart';

import '../../../../core/extensions.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';

const double _btnHeight = 48;

class AddCartBtn extends StatelessWidget {
  final int totalPrice;

  const AddCartBtn({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: null,
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        height: _btnHeight,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${totalPrice.toWon()}",
              style: textTheme.titleSmall.semiBold?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            TextSpan(
              text: " 장바구니 담기",
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
