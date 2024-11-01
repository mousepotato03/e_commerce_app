import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/util/exception/common_exception.dart';
import '../../../core/util/logger.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LogoutUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<void> call(UserRepository repository) async {
    try {
      await UserApi.instance.logout();
    } catch (e) {
      CustomLogger.logger.e("${e.toString()}");
      throw CommonException.setError(e);
    }
  }
}
