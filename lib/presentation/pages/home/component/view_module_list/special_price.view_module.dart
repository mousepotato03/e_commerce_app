import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/widget/add_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/extensions.dart';
import '../../../../../core/theme/constant/app_icons.dart';
import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/theme/custom/custom_theme.dart';
import '../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../../../domain/model/display/view_module/view_module.model.dart';
import 'view_module_factory/view_module_widget.dart';
import 'widget/timer_widget.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_subtitle.dart';
import 'widget/view_module_title.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;

  const SpecialPriceViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ViewModulePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewModuleTitle(title: info.title),
            ViewModuleSubtitle(subtitle: info.subtitle),
            if (info.time > 0)
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Lottie.asset(AppIcons.lottie_clock,
                        width: 20,
                        delegates: LottieDelegates(values: [
                          ValueDelegate.color(
                            ['Oval', 'Oval', 'Fill 1'],
                            value: Theme.of(context).colorScheme.inversePrimary,
                          )
                        ])),
                    SizedBox(width: 5),
                    TimerWidget(
                      endTime: DateTime.fromMillisecondsSinceEpoch(info.time),
                    ),
                  ],
                ),
              ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _SpecialPriceProduct(
                  productInfo: info.products[index],
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 16),
              itemCount: info.products.length,
            )
          ],
        ),
      ),
    );
  }
}

class _SpecialPriceProduct extends StatelessWidget {
  final ProductInfo productInfo;

  const _SpecialPriceProduct({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 343 / 174,
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            AddCartButton(productInfo),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Text(
          productInfo.subtitle,
          style: textTheme.labelLarge
              ?.copyWith(color: colorScheme.contentTertiary)
              .regular,
        ),
        Text(
          productInfo.title,
          style: textTheme.titleMedium?.titleCopyWith(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "${productInfo.discountRate}%",
              style: textTheme.titleLarge?.discountRateCopyWith(),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              productInfo.price.toWon(),
              style: textTheme.titleLarge?.priceCopyWith(),
            ),
            SizedBox(height: 4),
            Text(
              productInfo.originalPrice.toWon(),
              style: textTheme.titleSmall?.originalPriceCopyWith(),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.chat,
              width: 13,
              height: 13,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.contentTertiary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4),
            Text(
              "후기 ${productInfo.reviewCount.toReview()}",
              style: textTheme.labelMedium?.reviewCountCopyWith(),
            ),
          ],
        )
      ],
    );
  }
}
