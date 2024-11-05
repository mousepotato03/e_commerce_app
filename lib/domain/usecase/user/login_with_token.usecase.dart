import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/extensions.dart';
import '../../../core/util/error/error_response.dart';
import '../../../core/util/exception/common_exception.dart';
import '../../../core/util/logger.dart';
import '../../model/common/result.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LoginWithTokenUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<Result<User>> call(UserRepository repository) async {
    // 토큰 유효성 확인 및 갱신
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (error) {
        CustomLogger.logger.e('${error.toString()}');
        throw CommonException.setError(error);
      }
    } else {
      return Result.failure(
        ErrorResponse(),
      );
    }

    var user = await UserApi.instance.me();
    final result = await repository.getCustomToken(
      userId: user.id.toString(),
      email:
      user.kakaoAccount?.email ?? '${user.id.toString()}@facammarket.com',
    );

    if (result.status.isSuccess) {
      await FirebaseAuth.instance.signInWithCustomToken(result.data ?? '');

      return Result.success(user);
    }

    return Result.failure(
      ErrorResponse(
        status: result.status,
        code: result.code,
        message: result.message,
      ),
    );
  }
}
