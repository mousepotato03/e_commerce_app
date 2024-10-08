import '../../../../core/util/error/error_response.dart';
import '../../../../presentation/main/cubit/mall_type_cubit.dart';
import '../../../model/common/result.dart';
import '../../../repository/display.repository.dart';
import '../../base/remote.usecase.dart';

class GetMenusUsecase extends RemoteUsecase<DisplayRepository> {
  final MallType mallType;

  GetMenusUsecase({required this.mallType});

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.getMenuByMallType(mallType: mallType);

    return result.status == "SUCCESS"
        ? Result.Success(result.data ?? [])
        : Result.Failure(ErrorResponse(
            status: result.status,
            code: result.code,
            message: result.message,
          ));
  }
}
