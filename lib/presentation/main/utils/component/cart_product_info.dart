import 'package:flutter/material.dart';

import '../../../../core/theme/custom/custom_theme.dart';
import '../../../../domain/model/display/product_info/product_info.model.dart';

const double _imageSize = 48;

class CartProductInfo extends StatelessWidget {
  final ProductInfo productInfo;

  const CartProductInfo({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Image.network(
            productInfo.imageUrl,
            width: _imageSize,
            height: _imageSize,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.contentPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  productInfo.subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.contentTertiary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
