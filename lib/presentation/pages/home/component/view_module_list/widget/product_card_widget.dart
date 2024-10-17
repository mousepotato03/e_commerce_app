import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/extensions.dart';
import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../core/theme/constant/app_icons.dart';
import '../../../../../../core/theme/custom/custom_theme.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';
import 'add_cart_button.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double imageAspect;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? originalPriceStyle;
  final TextStyle? reviewStyle;

  final bool needShowReviewCount;

  const ProductCardWidget({
    super.key,
    required this.productInfo,
    required this.imageAspect,
    this.titleStyle,
    this.priceStyle,
    this.originalPriceStyle,
    this.reviewStyle,
    required this.needShowReviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: imageAspect,
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            AddCartButton(),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Text(
          productInfo.title,
          style: titleStyle?.titleCopyWith(),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          children: [
            Text(
              "${productInfo.discountRate}%",
              style: priceStyle?.discountRateCopyWith(),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              productInfo.price.toWon(),
              style: priceStyle?.priceCopyWith(),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          productInfo.originalPrice.toWon(),
          style: originalPriceStyle?.originalPriceCopyWith(),
        ),
        SizedBox(
          height: 8,
        ),
        if (needShowReviewCount)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
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
                SizedBox(
                  width: 4,
                ),
                Text(
                  "후기 ${productInfo.reviewCount.toReview()}",
                  style: reviewStyle?.reviewCountCopyWith(),
                ),
              ],
            ),
          )
      ],
    );
  }
}
