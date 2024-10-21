import '../../../../core/extensions.dart';
import '../../../../core/util/error/error_response.dart';
import '../../../model/common/result.dart';
import '../../../repository/display.repository.dart';
import '../../base/local.usecase.dart';

class ChangeCartQtyUsecase extends LocalUsecase<DisplayRepository> {
  final String productId;
  final int qty;

  ChangeCartQtyUsecase(this.productId, this.qty);

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.changeCartQuantityByPrdId(
        productId: productId, qty: qty);

    return result.status.isSuccess
        ? Result.success(result.data)
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
