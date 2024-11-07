import '../../../../core/util/error/error_response.dart';
import '../../../model/common/result.dart';
import '../../../model/display/display.model.dart';
import '../../../repository/display.repository.dart';
import '../../base/remote.usecase.dart';

class GetViewModulesUsecase extends RemoteUsecase<DisplayRepository> {
  final int tabId;
  final int page;
  final bool isRefresh;

  GetViewModulesUsecase({
    required this.tabId,
    required this.page,
    required this.isRefresh,
  });

  @override
  Future<Result<List<ViewModule>>> call(DisplayRepository repository) async {
    final result =
        await repository.getViewModuleByTabId(tabId: tabId, page: page, isRefresh: isRefresh);
    return result.status == "SUCCESS"
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
