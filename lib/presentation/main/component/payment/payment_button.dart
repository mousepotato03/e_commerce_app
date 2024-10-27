import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant.dart';
import '../../../../core/extensions.dart';
import '../../../../core/util/error/error_response.dart';
import '../../../../core/util/snack_bar/common_snack_bar.dart';
import '../../../../domain/model/display/cart/cart.model.dart';
import '../../../pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import '../../bloc/paymoent_bloc/payment_bloc.dart';

class PaymentButton extends StatelessWidget {
  final List<Cart> selectedCartList;
  final int totalPrice;

  const PaymentButton({
    super.key,
    required this.selectedCartList,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.status == PaymentStatus.success) {
          context
              .read<CartListBloc>()
              .add(CartListDeleted(productIds: state.productIds ?? []));

          CommonSnackBar.successSnackBar(context, msg: "결제가 성공적으로 진행됐습니다.");
        } else if (state.status == PaymentStatus.error) {
          CommonSnackBar.errorSnackBar(
            context,
            error: ErrorResponse(
              message: state.message,
            ),
          );
        }
      },
      child: Padding(
        padding: Constants.horizontalPadding,
        child: SizedBox(
          height: 48,
          child: TextButton(
            onPressed: selectedCartList.isNotEmpty
                ? () {
                    context.read<PaymentBloc>().add(
                          PayMoney(
                            cartList: selectedCartList,
                            context: context,
                          ),
                        );
                  }
                : null,
            style: TextButton.styleFrom(
              backgroundColor: selectedCartList.isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[400] ?? Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8,
                  ),
                ),
              ),
            ),
            child: Center(
              child: Text(
                selectedCartList.isNotEmpty
                    ? "${totalPrice.toWon()} 결제하기"
                    : "상품을 선택해주세요",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}