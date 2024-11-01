import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/util/exception/common_exception.dart';
import '../../../core/util/logger.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LoginWithTokenUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<User?> call(UserRepository repository) async {
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (e) {
        CustomLogger.logger.e("${e.toString()}");
        throw CommonException.setError(e);
      }
    } else {
      return null;
    }
    return await UserApi.instance.me();
  }
}
