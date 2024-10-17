import 'package:flutter/material.dart';

import '../../../../../domain/model/display/display.model.dart';
import 'view_module_factory/view_module_widget.dart';
import 'widget/product_card.component.dart';
import 'widget/product_card_widget.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;

  const ScrollViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return LargeProductCard(
      context: context,
      productInfo: info.products[0],
    );
  }
}
