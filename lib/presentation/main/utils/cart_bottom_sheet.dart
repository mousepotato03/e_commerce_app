import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc/cart_bloc.dart';
import 'component/add_cart_btn.dart';
import 'component/cart_benefit.dart';
import 'component/cart_price_info.dart';
import 'component/cart_product_info.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartProductInfo(
                    productInfo: state.productInfo,
                  ),
                  Divider(thickness: 1),
                  CartPriceInfo(
                    productInfo: state.productInfo,
                    quantity: state.quantity,
                  ),
                  CartBenefit(),
                  SizedBox(height: 12),
                  SizedBox(height: 12),
                  AddCartBtn(totalPrice: state.totalPrice),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      );
    },
    showDragHandle: true,
  );
}
